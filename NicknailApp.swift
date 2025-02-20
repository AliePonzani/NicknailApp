import SwiftUI

@main
struct NicknailApp: App {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameStartView().environmentObject(viewModel)
        }
    }
}
