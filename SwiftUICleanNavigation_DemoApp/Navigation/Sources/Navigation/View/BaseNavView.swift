import SwiftUI

/// Aims to define a Base Navigation View
/// - Owns the setup navigation logic
struct BaseNavView<Content: View, ViewModel: NavViewModel>: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ViewModel
    var contentView: Content
    
    // MARK: - Init
    init(viewModel: ViewModel, contentView: () -> Content) {
        let view = contentView()
        self.contentView = view
        self.viewModel = viewModel
    }
    
    // MARK: - Body's view
    var body: some View {
        contentView
            .setupNavigation(self.$viewModel.router.selectedRoute,
                             isPresented: self.$viewModel.router.isPresented)
    }
}

// MARK: - Fileprivate View extension
fileprivate extension View {
    /// Aims to setup the navigation with the related observation
    /// - Parameters:
    ///   - route: route to navigate
    ///   - isPresented: is presented or not
    /// - Returns: some View
    @ViewBuilder
    func setupNavigation<R: NavRoute>(_ route: Binding<R>, isPresented: Binding<Bool>) -> some View {
        switch route.wrappedValue.navigationMode {
        case .modal(let conf):
            self.sheet(isPresented: isPresented,
                       content: {
                Group {
                    if conf.withNavigation {
                        NavigationView {
                            route.wrappedValue.destination
                            
                        }
                    } else {
                        route.wrappedValue.destination
                    }
                }
                .presentationDetents(conf.presentationMode)
            })
        case .push:
            navigationDestination(isPresented: isPresented) {
                route.wrappedValue.destination
            }
        case .none:
            self
        }
    }
}
