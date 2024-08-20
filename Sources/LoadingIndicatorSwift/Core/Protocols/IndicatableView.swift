//
//  IndicatableView.swift
//  SwiftLoading
//
//  Created by CS37-MacMini on 12/08/24.
//

import UIKit

public protocol IndicatableView {
    /// Set the foreground color of the indicator
    var foregroundColor: UIColor { get set }
    
    /// Set the size of the indicator, for more info check ``LoaderSize``
    var size: LoaderSize { get set }
    
    /// Get the base view of the indicator
    var baseView: UIView { get }
    
    /// Start the indicator animation
    func start()
    
    /// Stop the indicator animation
    func stop()
}
