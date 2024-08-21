//
//  IndicatorConfiguration.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import Foundation
import UIKit

public class IndicatorConfiguration: Equatable {
    var view: Indicatable
    var foregroundColor: UIColor
    var size: LoaderSize
    
    /// Initialises the indicator configuration with new values or default values
    /// - Parameters:
    ///     - view: The configuration of the indicator view and its properties that can be changed at runtime
    ///     - foregroundColor: The color of the indicator
    ///     - loaderSize: The size of the indicator
    public init(view: Indicatable = DefaultIndicator(), foregroundColor: UIColor = .gray, size: LoaderSize = .medium) {
        self.view = view
        self.foregroundColor = foregroundColor
        self.size = size
    }
    
    /// Standard indicator configuration with default values
    public static var standard: IndicatorConfiguration = .init()
    
    /// Copies the current indicator configuration with new values or default values
    public func copyWith(view: Indicatable? = nil, foregroundColor: UIColor? = nil, size: LoaderSize? = nil) -> IndicatorConfiguration {
        self.view = view ?? self.view
        self.foregroundColor = foregroundColor ?? self.foregroundColor
        self.size = size ?? self.size
        
        return self
    }
    
    /// Checks if two indicator configurations are equal
    public static func == (lhs: IndicatorConfiguration, rhs: IndicatorConfiguration) -> Bool {
        lhs.foregroundColor == rhs.foregroundColor && lhs.size == rhs.size
    }
}
