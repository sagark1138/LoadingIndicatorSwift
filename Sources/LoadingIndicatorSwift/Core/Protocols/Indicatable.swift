//
//  Indicatable.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import UIKit

public protocol Indicatable {
    /// Set the foreground color of the indicator
    var foregroundColor: UIColor { get set }
    
    /// Set the size of the indicator, for more info check ``LoaderSize``
    var loaderSize: LoaderSize { get set }
    
    /// Get the base view of the indicator
    var baseView: UIView { get }
    
    /// Setup the indicator
    func setup()
    
    /// Start the indicator animation
    func start()
    
    /// Stop the indicator animation
    func stop()
}
