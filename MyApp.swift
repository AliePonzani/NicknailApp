import SwiftUI

@main
struct MyApp: App {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                GameStartView().environmentObject(viewModel)
            }
        }
    }
}
