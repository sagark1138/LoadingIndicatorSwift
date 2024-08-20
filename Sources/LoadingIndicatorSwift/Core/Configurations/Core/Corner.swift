//
//  Corner.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 29/04/24.
//

import UIKit

public enum Corner: Equatable {
    /// No corner radius
    case none
    /// Round all corners with specified radius
    case rounded(all: CGFloat)
    /// Round specified corners with specified radius
    case edge(corners: UIRectCorner, radius: CGFloat)
    /// Round corners as capsule
    case capsule
}
