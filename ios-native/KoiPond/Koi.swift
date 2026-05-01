import SpriteKit

/// A single koi. Wander + neighbor avoidance, tuned to feel close to the
/// browser version while taking advantage of native rendering for body
/// segmentation and per-scale shading.
final class Koi: SKNode {
    var bounds: CGRect
    private var velocity: CGVector
    private let maxSpeed: CGFloat = 70
    private let turnRate: CGFloat = 1.8
    private let avoidRadius: CGFloat = 56
    private let minSeparation: CGFloat = 6   // floor on neighbor distance, prevents force singularity at overlap

    private let body: SKShapeNode

    init(bounds: CGRect) {
        self.bounds = bounds
        let angle = CGFloat.random(in: 0..<(2 * .pi))
        self.velocity = CGVector(dx: cos(angle) * 40, dy: sin(angle) * 40)

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 18, y: 0))
        path.addQuadCurve(to: CGPoint(x: -18, y: 0),
                          control: CGPoint(x: 0, y: 9))
        path.addQuadCurve(to: CGPoint(x: 18, y: 0),
                          control: CGPoint(x: 0, y: -9))
        path.closeSubpath()

        self.body = SKShapeNode(path: path)
        let palette: [SKColor] = [
            SKColor(red: 0.95, green: 0.50, blue: 0.30, alpha: 1.0),
            SKColor(red: 0.98, green: 0.92, blue: 0.86, alpha: 1.0),
            SKColor(red: 0.20, green: 0.20, blue: 0.22, alpha: 1.0),
            SKColor(red: 0.85, green: 0.78, blue: 0.40, alpha: 1.0)
        ]
        self.body.fillColor = palette.randomElement()!
        self.body.strokeColor = SKColor.black.withAlphaComponent(0.25)
        self.body.lineWidth = 0.5

        super.init()
        addChild(self.body)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tick(dt: CGFloat, neighbors: [Koi]) {
        var steer = CGVector.zero
        for other in neighbors where other !== self {
            let dx = position.x - other.position.x
            let dy = position.y - other.position.y
            let distSq = dx * dx + dy * dy
            if distSq > 0 && distSq < avoidRadius * avoidRadius {
                let dist = max(sqrt(distSq), minSeparation)
                steer.dx += (dx / dist) * (800 / dist)
                steer.dy += (dy / dist) * (800 / dist)
            }
        }

        steer.dx += .random(in: -8...8)
        steer.dy += .random(in: -8...8)

        velocity.dx += steer.dx * dt * turnRate
        velocity.dy += steer.dy * dt * turnRate

        let speed = sqrt(velocity.dx * velocity.dx + velocity.dy * velocity.dy)
        if speed > maxSpeed {
            velocity.dx = velocity.dx / speed * maxSpeed
            velocity.dy = velocity.dy / speed * maxSpeed
        }

        position.x += velocity.dx * dt
        position.y += velocity.dy * dt

        if !bounds.isEmpty {
            if position.x < bounds.minX { position.x = bounds.maxX }
            if position.x > bounds.maxX { position.x = bounds.minX }
            if position.y < bounds.minY { position.y = bounds.maxY }
            if position.y > bounds.maxY { position.y = bounds.minY }
        }

        if speed > 0.001 {
            zRotation = atan2(velocity.dy, velocity.dx)
        }
    }
}
