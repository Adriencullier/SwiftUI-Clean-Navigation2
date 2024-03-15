import SwiftUI
import Combine

/// Aims to define a NavigationViewModel
public protocol NavViewModel: ObservableObject {
    /// NavigationRouter associated type
    associatedtype Router: NavRouter
    /// NavigationRouter
    /// Needs to be declare @Published
    var router: Router { get set }
    /// Combine subscription
    var subscription: AnyCancellable?  { get set }
}

// MARK: - NavViewModel extension
public extension NavViewModel where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
    /// Aims to subscribe to the Navigation router
    /// Needs to be called at NavViewModel init
    func routerSubscription() {
        self.subscription = router.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
