//
//  Padding.swift
//  LoadingDemo
//
//  Created by CS17-MAC on 29/04/24.
//

import Foundation
import UIKit

public struct Padding: Equatable {
    let edgeInsets: UIEdgeInsets
    
    /// Initialize padding with custom edge insets
    /// - Parameter edgeInsets: The edge insets
    public init(edgeInsets: UIEdgeInsets = .zero) {
        self.edgeInsets = edgeInsets
    }
    
    /// Intialize padding with horizontal and vertical edges
    /// - Parameters:
    ///   - horizontal: The horizontal edge
    ///   - vertical: The vertical edge
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.edgeInsets = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    /// Initialize padding with all edges
    /// - Parameter all: All edges: top, left, bottom, right
    public init(all: CGFloat = 0) {
        self.edgeInsets = UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
    
    /// Standard padding
    public static var standard: Padding {
        .init(edgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}
