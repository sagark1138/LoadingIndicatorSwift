//
//  IndicatorConfiguration.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import Foundation
import UIKit

public struct IndicatorConfiguration: Equatable {
    let view: IndicatableView
    let foregroundColor: UIColor
    let size: LoaderSize
    
    /// Initialises the indicator configuration with new values or default values
    /// - Parameters:
    ///     - view: The configuration of the indicator view and its properties that can be changed at runtime
    ///     - foregroundColor: The color of the indicator
    ///     - size: The size of the indicator
    public init(view: IndicatableView = SystemLoadingIndicator(), foregroundColor: UIColor = .gray, size: LoaderSize = .medium) {
        self.view = view
        self.foregroundColor = foregroundColor
        self.size = size
    }
    
    /// Standard indicator configuration with default values
    public static var standard: IndicatorConfiguration {
        .init()
    }
    
    /// Copies the current indicator configuration with new values or default values
    public func copyWith(view: IndicatableView? = nil, foregroundColor: UIColor? = nil, size: LoaderSize? = nil) -> IndicatorConfiguration {
        let view = view ?? self.view
        let foregroundColor = foregroundColor ?? self.foregroundColor
        let size = size ?? self.size
        
        return IndicatorConfiguration(view: view, foregroundColor: foregroundColor, size: size)
    }
    
    /// Checks if two indicator configurations are equal
    public static func == (lhs: IndicatorConfiguration, rhs: IndicatorConfiguration) -> Bool {
        lhs.foregroundColor == rhs.foregroundColor && lhs.size == rhs.size
    }
}
