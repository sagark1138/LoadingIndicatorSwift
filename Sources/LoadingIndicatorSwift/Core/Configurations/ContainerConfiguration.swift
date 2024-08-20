//
//  ContainerConfiguration.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 29/04/24.
//

import Foundation
import CoreGraphics
import UIKit

public struct ContainerConfiguration: Equatable {
    var background: UIColor
    var corner: Corner
    var shadow: Shadow
    var border: Border
    var padding: Padding

    /// Initializes a new ContainerConfiguration with new or default values
    /// - Parameters:
    ///   - background: The background color
    ///   - corner: The corner radius, for more info see ``Corner``
    ///   - shadow: The shadow, for more info see ``Shadow``
    ///   - border: The border, for more info see ``Border``
    ///   - padding: The padding, for more info see ``Padding``
    public init(background: UIColor = .white, corner: Corner = .rounded(all: 8), shadow: Shadow = .standard, border: Border = .none, padding: Padding = .standard) {
        self.background = background
        self.corner = corner
        self.shadow = shadow
        self.border = border
        self.padding = padding
    }
    
    /// Standard container configuration with default values
    public static var standard: ContainerConfiguration {
        .init()
    }
    
    /// Container configuration without any visuals
    public static var none: ContainerConfiguration {
        .init(background: .clear, corner: .none, shadow: .none, border: .none, padding: .init(all: 0))
    }
    
    /// Copies the current container configuration with new or default values
    public func copyWith(background: UIColor? = nil, corner: Corner? = nil, shadow: Shadow? = nil, border: Border? = nil, padding: Padding? = nil) -> ContainerConfiguration {
        let background = background ?? self.background
        let corner = corner ?? self.corner
        let shadow = shadow ?? self.shadow
        let border = border ?? self.border
        let padding = padding ?? self.padding
        
        return ContainerConfiguration(background: background, corner: corner, shadow: shadow, border: border, padding: padding)
    }
    
    /// Checks if two container configurations are equal
    public static func == (lhs: ContainerConfiguration, rhs: ContainerConfiguration) -> Bool {
        lhs.background == rhs.background
            && lhs.corner == rhs.corner
            && lhs.shadow == rhs.shadow
            && lhs.border == rhs.border
            && lhs.padding == rhs.padding
    }
}
