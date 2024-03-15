import SwiftUI

/// Aims to define the modal configuration
public struct ModalConfiguration {
    // MARK: - Properties
    /// Defines if the view is embeded in a NavigationView or not
    public var withNavigation: Bool
    /// Defines the PresentationDetents of the view
    public var presentationMode: Set<PresentationDetent>
    
    // MARK: - Init
    public init(withNavigation: Bool = false, presentationMode: Set<PresentationDetent> = [.large]) {
        self.withNavigation = withNavigation
        self.presentationMode = presentationMode
    }
}
