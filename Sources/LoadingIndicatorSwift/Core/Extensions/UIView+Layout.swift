//
//  UIView+Layout.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 02/08/24.
//

import UIKit

extension UIView {
    
    enum ContentFit {
        case fill
        case center
        case centerWithSize(size: CGSize)
    }
    
    func add(parent: UIView, fit: ContentFit = .center) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        switch fit {
        case .fill:
            leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        case .center:
            centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
        case .centerWithSize(let size):
            centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
