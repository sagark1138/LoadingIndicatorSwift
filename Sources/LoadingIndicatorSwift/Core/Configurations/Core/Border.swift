//
//  Border.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 29/04/24.
//

import Foundation
import CoreGraphics
import UIKit

public struct Border: Equatable {
    let color: UIColor
    let width: CGFloat
    
    /// Initializes a new Border with new values or default values
    /// - Parameters:
    ///   - color: The color of the border
    ///   - width: The width of the border
    public init(color: UIColor = UIColor.black, width: CGFloat = 1) {
        self.color = color
        self.width = width
    }

    /// Standard border with default values
    public static var standard: Border {
        .init()
    }
    
    /// Border without any visuals
    public static var none: Border {
        .init(color: .clear, width: 0)
    }
    
    /// Copies the current border with new values or default values
    public func copyWith(color: UIColor? = nil, width: CGFloat? = nil) -> Border {
        let color = color ?? self.color
        let width = width ?? self.width
        
        return Border(color: color, width: width)
    }
}
