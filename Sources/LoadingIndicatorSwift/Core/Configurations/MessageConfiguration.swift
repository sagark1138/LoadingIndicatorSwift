//
//  MessageConfiguration.swift
//  LoadingDemo
//
//  Created by CS17-MAC on 29/04/24.
//

import Foundation
import UIKit

public struct MessageConfiguration: Equatable {
    let color: UIColor
    let font: UIFont
    let alignment: NSTextAlignment
    let position: ContentPosition
    let spacing: CGFloat
    
    /// Initializes a new MessageConfiguration with new values or default values
    /// - Parameters:
    ///   - color: The color of the message
    ///   - font: The font of the message
    ///   - alignment: The alignment of the message
    ///   - position: The position of the message, possible values: .left, .right, .top, .bottom. For more information see ``ContentPosition``
    ///   - spacing: The spacing between the message and the indicator
    public init(color: UIColor = .black, font: UIFont = .systemFont(ofSize: 16), alignment: NSTextAlignment = .center, position: ContentPosition = .bottom, spacing: CGFloat = 8) {
        self.color = color
        self.font = font
        self.alignment = alignment
        self.position = position
        self.spacing = spacing
    }

    /// Standard message configuration with default values
    public static var standard: MessageConfiguration {
        .init()
    }
    
    /// Copies the current message configuration with new values or default values
    public func copyWith(color: UIColor? = nil, font: UIFont? = nil, alignment: NSTextAlignment? = nil, position: ContentPosition? = nil, spacing: CGFloat? = nil) -> MessageConfiguration {
        let color = color ?? self.color
        let font = font ?? self.font
        let alignment = alignment ?? self.alignment
        let position = position ?? self.position
        let spacing = spacing ?? self.spacing
        
        return MessageConfiguration(color: color, font: font, alignment: alignment, position: position, spacing: spacing)
    }
}
