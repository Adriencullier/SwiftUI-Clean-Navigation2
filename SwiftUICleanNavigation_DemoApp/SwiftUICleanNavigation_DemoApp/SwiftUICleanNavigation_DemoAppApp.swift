import SwiftUI

@main
struct SwiftUICleanNavigation_DemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(viewModel: HomeViewModel(router: HomeRouter()))
            }
        }
    }
}
