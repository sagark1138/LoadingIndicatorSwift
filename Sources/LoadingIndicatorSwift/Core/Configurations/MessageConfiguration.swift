//
//  MessageConfiguration.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 29/04/24.
//

import Foundation
import UIKit

public class MessageConfiguration: Equatable {
    var color: UIColor
    var font: UIFont
    var alignment: NSTextAlignment
    var position: ContentPosition
    var spacing: CGFloat
    
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
    public static var standard: MessageConfiguration = .init()
    
    /// Copies the current message configuration with new values or default values
    public func copyWith(color: UIColor? = nil, font: UIFont? = nil, alignment: NSTextAlignment? = nil, position: ContentPosition? = nil, spacing: CGFloat? = nil) -> MessageConfiguration {
        self.color = color ?? self.color
        self.font = font ?? self.font
        self.alignment = alignment ?? self.alignment
        self.position = position ?? self.position
        self.spacing = spacing ?? self.spacing
        
        return self
    }
    
    /// Checks if two message configurations are equal
    public static func == (lhs: MessageConfiguration, rhs: MessageConfiguration) -> Bool {
        lhs.color == rhs.color && lhs.font == rhs.font && lhs.alignment == rhs.alignment && lhs.position == rhs.position && lhs.spacing == rhs.spacing
    }
}
