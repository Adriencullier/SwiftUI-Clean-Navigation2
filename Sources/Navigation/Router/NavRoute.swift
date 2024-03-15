import SwiftUI

/// Aims to define a navigation route
public protocol NavRoute {
    /// Destination view of the route
    var destination: AnyView { get }
    /// Navigation mode used to display the view
    var navigationMode: NavigationMode { get }
}
