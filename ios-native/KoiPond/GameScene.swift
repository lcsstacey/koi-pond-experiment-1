import SpriteKit

final class GameScene: SKScene {
    private let koiCount = 12
    private var koi: [Koi] = []
    private var background: SKShapeNode?
    private var lastUpdate: TimeInterval = 0

    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.012, green: 0.051, blue: 0.051, alpha: 1.0)
        addPondBackground()
        spawnKoi()
    }

    override func didChangeSize(_ oldSize: CGSize) {
        background?.path = CGPath(rect: self.frame, transform: nil)
        for fish in koi {
            fish.bounds = self.frame
        }
    }

    override func update(_ currentTime: TimeInterval) {
        let dt: CGFloat
        if lastUpdate == 0 {
            dt = 1.0 / 60.0
        } else {
            dt = CGFloat(min(currentTime - lastUpdate, 1.0 / 30.0))
        }
        lastUpdate = currentTime

        for fish in koi {
            fish.tick(dt: dt, neighbors: koi)
        }
    }

    private func addPondBackground() {
        let bg = SKShapeNode(path: CGPath(rect: self.frame, transform: nil))
        bg.fillColor = SKColor(red: 0.04, green: 0.16, blue: 0.16, alpha: 1.0)
        bg.strokeColor = .clear
        bg.zPosition = -10
        addChild(bg)
        self.background = bg
    }

    private func spawnKoi() {
        for _ in 0..<koiCount {
            let fish = Koi(bounds: self.frame)
            fish.position = CGPoint(
                x: .random(in: frame.minX...frame.maxX),
                y: .random(in: frame.minY...frame.maxY)
            )
            addChild(fish)
            koi.append(fish)
        }
    }
}
