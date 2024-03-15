import SwiftUI
import Navigation

struct HomeView: NavView {
    typealias ViewModel = HomeViewModel

    var viewModel: HomeViewModel
    
    var content: AnyView {
        AnyView(
            VStack {
                Button {
                    self.viewModel.onModalButtonPressed()
                } label: {
                    Text("Modal view")
                }
                .buttonStyle(.borderedProminent)
                Button {
                    self.viewModel.onPushButtonPressed()
                } label: {
                    Text("Push view")
                }
                .buttonStyle(.borderedProminent)
            }.navigationTitle("Home View")
        )
    }
}
