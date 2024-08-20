//
//  SystemLoadingIndicator.swift
//  SwiftLoading
//
//  Created by CS37-MacMini on 12/08/24.
//

import UIKit

public class SystemLoadingIndicator: UIActivityIndicatorView, IndicatableView {
    /// Set the foreground color of the indicator
    public var foregroundColor: UIColor = .gray {
        didSet {
            color = foregroundColor
        }
    }
    
    /// Set the size of the indicator, for more info check ``LoaderSize``
    public var size: LoaderSize = .medium {
        didSet {
            self.style = size.system
        }
    }
    
    /// Get the base view of the indicator
    public var baseView: UIView {
        return self
    }
    
    /// Start the indicator animation
    public func start() {
        self.startAnimating()
    }
    
    /// Stop the indicator animation
    public func stop() {
        self.stopAnimating()
    }
}
