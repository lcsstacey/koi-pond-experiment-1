import SpriteKit

final class GameScene: SKScene {
    private let koiCount = 12
    private var koi: [Koi] = []

    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.012, green: 0.051, blue: 0.051, alpha: 1.0)
        addPondBackground()
        spawnKoi()
    }

    override func didChangeSize(_ oldSize: CGSize) {
        for fish in koi {
            fish.bounds = self.frame
        }
    }

    override func update(_ currentTime: TimeInterval) {
        for fish in koi {
            fish.tick(neighbors: koi)
        }
    }

    private func addPondBackground() {
        let bg = SKShapeNode(rect: self.frame)
        bg.fillColor = SKColor(red: 0.04, green: 0.16, blue: 0.16, alpha: 1.0)
        bg.strokeColor = .clear
        bg.zPosition = -10
        addChild(bg)
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
