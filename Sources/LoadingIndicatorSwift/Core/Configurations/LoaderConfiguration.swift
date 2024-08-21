//
//  LoaderConfiguration.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import Foundation

public final class LoaderConfiguration {
    var indicator: IndicatorConfiguration
    var message: MessageConfiguration
    var container: ContainerConfiguration
    
    /// Initialises the loader configuration with new values or default values
    /// - Parameters:
    ///     - indicator: The configuration of the indicator view and its properties that can be changed at runtime, for more info see ``IndicatorConfiguration``
    ///     - message:  The configuration of the message view and its properties that can be changed at runtime, for more info see ``MessageConfiguration``
    ///     - container: The configuration of the container view and its properties that can be changed at runtime, for more info see ``ContainerConfiguration``
    public init(indicator: IndicatorConfiguration = .standard, message: MessageConfiguration = .standard, container: ContainerConfiguration = .standard) {
        self.indicator = indicator
        self.message = message
        self.container = container
    }
    
    /// Standard loader configuration with default values
    public static var standard: LoaderConfiguration = .init()
    
    /// Copies the current loader configuration with new values or default values
    public func copyWith(indicator: IndicatorConfiguration? = nil, message: MessageConfiguration? = nil, container: ContainerConfiguration? = nil) -> LoaderConfiguration {
        self.indicator = indicator ?? self.indicator
        self.message = message ?? self.message
        self.container = container ?? self.container
        
        return self
    }
}
