//
//  UIView+.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 29/04/24.
//

import Foundation
import UIKit

extension UIView {
    
    func apply(configuration: ContainerConfiguration) {
        // background
        self.layer.backgroundColor = configuration.background.cgColor
        
        // border
        self.apply(border: configuration.border)

        // shadow
        self.apply(shadow: configuration.shadow)

        // corners
        self.apply(corner: configuration.corner)
    }
    
    func apply(corner: Corner) {
        switch corner {
        
        case .rounded(all: let all):
            self.layer.cornerRadius = all
            break
        case .edge(corners: let corners, radius: let radius):
            self.round(corners: corners, radius: radius)
            break
        case .capsule:
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) * 0.5
            break
        case .none:
            self.layer.cornerRadius = 0
            break
        }
    }
    
    func apply(shadow: Shadow) {
        self.layer.shadowColor = shadow.color.cgColor
        self.layer.shadowOffset = shadow.offset
        self.layer.shadowOpacity = shadow.opacity
        self.layer.shadowRadius  = shadow.radius
    }
    
    func apply(border: Border) {
        self.layer.borderColor = border.color.cgColor
        self.layer.borderWidth = border.width
    }
    
    func round(corners: UIRectCorner, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners.toCornerMask
    }
}

fileprivate extension UIRectCorner {
    var toCornerMask: CACornerMask {
        var mask: CACornerMask = []
        if self.contains(.allCorners) {
            mask.insert(.layerMinXMinYCorner)
            mask.insert(.layerMaxXMinYCorner)
            mask.insert(.layerMinXMaxYCorner)
            mask.insert(.layerMaxXMaxYCorner)
        } else {
            if self.contains(.topLeft) {
                mask.insert(.layerMinXMinYCorner)
            }
            if self.contains(.topRight) {
                mask.insert(.layerMaxXMinYCorner)
            }
            if self.contains(.bottomLeft) {
                mask.insert(.layerMinXMaxYCorner)
            }
            if self.contains(.bottomRight) {
                mask.insert(.layerMaxXMaxYCorner)
            }
        }
        return mask
    }
}
