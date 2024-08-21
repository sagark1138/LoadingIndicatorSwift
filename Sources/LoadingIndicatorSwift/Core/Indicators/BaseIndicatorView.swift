//
//  BaseIndicatorView.swift
//
//
//  Created by Sagar Kulkarni on 21/08/24.
//

import UIKit

public class BaseIndicatorView: UIView, Indicatable {
    
    public var foregroundColor: UIColor = .gray
    
    public var loaderSize: LoaderSize = .medium {
        didSet {
            updateLayout()
        }
    }
    
    public var baseView: UIView {
        return self
    }
    
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func setup() {
        // Add width and height constraints based on size
        translatesAutoresizingMaskIntoConstraints = false
        
        widthConstraint = widthAnchor.constraint(equalToConstant: self.loaderSize.size.width)
        widthConstraint?.isActive = true
        heightConstraint = heightAnchor.constraint(equalToConstant: self.loaderSize.size.height)
        heightConstraint?.isActive = true
    }
    
    public func start() {}
    
    public func stop() {}
    
    private func updateLayout() {
        widthConstraint?.constant = self.loaderSize.size.width
        heightConstraint?.constant = self.loaderSize.size.height
        
        layoutIfNeeded()
    }
}
