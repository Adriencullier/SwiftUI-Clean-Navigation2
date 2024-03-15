import Navigation
import SwiftUI

final class HomeRouter: NavRouter {
    typealias Route = HomeRoute
    
    @Published var isPresented: Bool = false
    @Published var selectedRoute: Route = .none
}

extension HomeRouter {
    enum HomeRoute: NavRoute {
        case modalView(dismissAction: () -> Void)
        case pushView(backAction: () -> Void)
        case none
        
        var destination: AnyView {
            switch self {
            case .modalView(let dismissAction):
                AnyView(ModalView(dismissAction: dismissAction))
            case .pushView(let backAction):
                AnyView(PushView(backAction: backAction))                
            case .none:
                AnyView(EmptyView())
            }
        }
        
        var navigationMode: NavigationMode {
            switch self {
            case .modalView:
                    .modal(conf: ModalConfiguration(withNavigation: true, presentationMode: [.medium, .large]))
            case .pushView:
                    .push(conf: PushConfiguration())
            case .none:
                    .none
            }
        }
    }
}
