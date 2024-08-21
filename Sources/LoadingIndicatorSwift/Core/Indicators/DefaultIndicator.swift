//
//  DefaultIndicator.swift
//
//
//  Created by Sagar Kulkarni on 21/08/24.
//

import UIKit

/// Default indicator is a system activity indicator
public class DefaultIndicator: BaseIndicatorView {
    
    private lazy var indicator = UIActivityIndicatorView()
    
    public override var foregroundColor: UIColor {
        didSet {
            indicator.color = foregroundColor
        }
    }
    
    public override var loaderSize: LoaderSize {
        didSet {
            indicator.style = loaderSize.system
        }
    }
    
    public override func setup() {
        super.setup()
        indicator.add(parent: self, fit: .center)
    }
    
    public override func start() {
        indicator.startAnimating()
    }
    
    public override func stop() {
        indicator.stopAnimating()
    }
}
