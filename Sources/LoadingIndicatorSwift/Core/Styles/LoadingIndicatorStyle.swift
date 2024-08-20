//
//  LoadingIndicatorStyle.swift
//  SwiftLoading
//
//  Created by CS37-MacMini on 12/08/24.
//

public enum LoadingIndicatorStyle {
    /// Shows indicator only
    case indicator
    /// Show message only
    case message
    /// Shows indicator and message
    case indicator_message
    /// Shows indicator and container
    case indicator_container
    /// Shows message and container
    case message_container
    /// Shows indicator, message and container
    case indicator_message_container
}

extension LoadingIndicatorStyle {
    
    struct ComponentVisibility {
        let showIndicator: Bool
        let showMessage: Bool
        let showContainer: Bool
    }

    /// Get component visibility based on the loading indicator style
    var componentVisibility: ComponentVisibility {
        switch self {
        case .indicator:
            return ComponentVisibility(showIndicator: true, showMessage: false, showContainer: false)
        case .message:
            return ComponentVisibility(showIndicator: false, showMessage: true, showContainer: false)
        case .indicator_message:
            return ComponentVisibility(showIndicator: true, showMessage: true, showContainer: false)
        case .indicator_container:
            return ComponentVisibility(showIndicator: true, showMessage: false, showContainer: true)
        case .message_container:
            return ComponentVisibility(showIndicator: false, showMessage: true, showContainer: true)
        case .indicator_message_container:
            return ComponentVisibility(showIndicator: true, showMessage: true, showContainer: true)
        }
    }
}
