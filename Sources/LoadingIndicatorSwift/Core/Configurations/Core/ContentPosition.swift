//
//  ContentPosition.swift
//  LoadingDemo
//
//  Created by CS17-MAC on 29/04/24.
//

import Foundation
import UIKit

public enum ContentPosition {
    case left, right, top, bottom
    
    /// Get axis based on the content position
    public var axis: NSLayoutConstraint.Axis {
        switch self {
        case .left, .right: .horizontal
        case .top, .bottom: .vertical
        }
    }
    
    /// Get index based on the content position
    public var indexPosition: Int {
        self == .left || self == .top ? 0 : 1
    }
}
