import UIKit

class OrientationLockedViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Define que a orientação permitida é apenas landscape (horizontal)
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        // Impede que a orientação rotacione
        return false
    }
}
