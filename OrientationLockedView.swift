import SwiftUI

struct OrientationLockedView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> OrientationLockedViewController {
        return OrientationLockedViewController()
    }

    func updateUIViewController(_ uiViewController: OrientationLockedViewController, context: Context) {
        // Não é necessário atualizar nada, pois a orientação é fixa
    }
}
