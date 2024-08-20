//
//  LoaderSize.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import Foundation
import UIKit

public enum LoaderSize: Equatable {
    case small
    case medium
    case large
    /// Provide custom size for the loader
    case custom(size: CGSize)
    
    /// Get size based on the loader size
    public var size: CGSize {
        switch self {
        case .small:
            return CGSize(width: 40, height: 40)
        case .medium:
            return CGSize(width: 60, height: 60)
        case .large:
            return CGSize(width: 80, height: 80)
        case .custom(let size):
            return size
        }
    }
}

extension LoaderSize {
    /// Get system style based on the loader size
    public var system: UIActivityIndicatorView.Style {
        switch self {
        case .large: .large
        default: .medium
        }
    }
}
