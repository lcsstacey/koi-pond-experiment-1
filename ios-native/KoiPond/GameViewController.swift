import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    override func loadView() {
        let skView = SKView()
        skView.ignoresSiblingOrder = true
        skView.preferredFramesPerSecond = 60
        skView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = skView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let skView = view as? SKView else { return }
        if skView.scene == nil, skView.bounds.size != .zero {
            let scene = GameScene(size: skView.bounds.size)
            scene.scaleMode = .resizeFill
            skView.presentScene(scene)
        }
    }

    override var prefersStatusBarHidden: Bool { true }
    override var prefersHomeIndicatorAutoHidden: Bool { true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .all }
}
