import SwiftUI

/// Aims to define a navigation Router
public protocol NavRouter: ObservableObject {
    /// Navigation route associated type
    associatedtype Route: NavRoute

    /// Defines if the selected route is presented or not
    /// Needs to be declare @Published
    var isPresented: Bool { get set }
    /// Selected route
    /// Needs to be declare @Published
    var selectedRoute: Route { get set }
}

public extension NavRouter {
    /// Aims to navigate to a specific route
    /// - Parameter route: route to navigate
    func navigate(to route: Route) {
        self.selectedRoute = route
        self.isPresented = true
    }
    
    /// Aims to dismiss the presented route
    func dismiss() {
        self.isPresented = false
    }
}
