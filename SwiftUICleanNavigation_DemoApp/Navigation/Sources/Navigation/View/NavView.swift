import SwiftUI

/// Aims to define a Navigation View
public protocol NavView: View {
    /// NavigationViewModel associated type
    associatedtype ViewModel: NavViewModel
    /// NavigationViewModel
    var viewModel: ViewModel { get set }
    /// Content of the view
    var content: AnyView { get }
}

public extension NavView {
    var body: some View {
        BaseNavView(viewModel: self.viewModel) {
            self.content
        }
    }
}
