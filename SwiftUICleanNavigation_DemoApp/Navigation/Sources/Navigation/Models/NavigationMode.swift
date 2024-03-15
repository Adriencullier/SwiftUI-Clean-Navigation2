import Foundation

/// Aims to list all the possible navigation modes
public enum NavigationMode {
    /// Modal presentation
    case modal(conf: ModalConfiguration)
    /// Push presentation
    case push(conf: PushConfiguration)
    /// No presentation
    /// Used at the router initialization
    case none
}
