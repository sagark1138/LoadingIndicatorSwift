//
//  Shadow.swift
//  LoadingDemo
//
//  Created by CS17-MAC on 29/04/24.
//

import Foundation
import CoreGraphics
import UIKit

public struct Shadow: Equatable {
    let color: UIColor
    let offset: CGSize
    let radius: CGFloat
    let opacity: Float
    
    /// Initializes a new Shadow with new values or default values
    /// - Parameters:
    ///   - color: The color of the shadow
    ///   - offset: The offset of the shadow
    ///   - radius: The radius of the shadow
    ///   - opacity: The opacity of the shadow
    public init(color: UIColor = UIColor.black, offset: CGSize = .zero, radius: CGFloat = 4, opacity: Float = 0.2) {
        self.color = color
        self.offset = offset
        self.radius = radius
        self.opacity = opacity
    }
    
    /// Standard shadow with default values
    public static var standard: Shadow {
        .init(color: UIColor.black, offset: .zero, radius: 4, opacity: 0.2)
    }
    
    /// Shadow without any visuals
    public static var none: Shadow {
        .init(color: .clear, offset: .zero, radius: 0, opacity: 0)
    }
    
    /// Copies the current shadow with new values or default values
    public func copyWith(color: UIColor? = nil, offset: CGSize? = nil, radius: CGFloat? = nil, opacity: Float? = nil) -> Shadow {
        let color = color ?? self.color
        let offset = offset ?? self.offset
        let radius = radius ?? self.radius
        let opacity = opacity ?? self.opacity
        
        return Shadow(color: color, offset: offset, radius: radius, opacity: opacity)
    }
}
