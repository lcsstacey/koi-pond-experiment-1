import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    override func loadView() {
        let view = SKView(frame: UIScreen.main.bounds)
        view.ignoresSiblingOrder = true
        view.preferredFramesPerSecond = 60
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let skView = view as? SKView else { return }

        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool { true }
    override var prefersHomeIndicatorAutoHidden: Bool { true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .all }
}
