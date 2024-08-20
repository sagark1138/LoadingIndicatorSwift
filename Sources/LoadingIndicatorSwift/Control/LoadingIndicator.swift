//
//  LoadingIndicator.swift
//  LoadingIndicatorSwift
//
//  Created by Sagar Kulkarni on 12/08/24.
//

import UIKit

public class LoadingIndicator: UIControl {
    
    // MARK: - Properties
    
    /// State of the loading indicator view, it can be used to control the loading state
    public var isLoading: Bool = false {
        didSet {
            if isLoading {
                startLoading()
            } else {
                stopLoading()
            }
        }
    }
    
    /// The message that will be displayed in the indicator
    public var message: String? {
        didSet {
            messageLabel.text = message
        }
    }
    
    /// The color of the overlay that covers the screen
    ///  - Note: The default value is `UIColor.black.withAlphaComponent(0.2)`
    public var overlayColor: UIColor? {
        didSet {
            self.backgroundColor = overlayColor ?? UIColor.black.withAlphaComponent(0.2)
        }
    }
    
    // MARK: - Configuration properties
    
    /// The configuration of the indicator view and its properties that can be changed at runtime
    ///
    /// - Note: The default value is `LoaderConfiguration.standard`
    ///
    /// ```swift
    /// LoaderConfiguration.standard.copyWith(
    ///     indicator: .standard.copyWith(foregroundColor: .systemOrange, size: .large),
    ///     message: .standard.copyWith(font: .boldSystemFont(ofSize: 16), spacing: 16),
    ///     container: .standard.copyWith(padding: .init(all: 16))
    /// )
    /// ```
    public var configuration = LoaderConfiguration.standard {
        didSet {
            indicatorConfiguration = configuration.indicator
            messageConfiguration = configuration.message
            containerConfiguration = configuration.container
        }
    }
    
    private var indicatorConfiguration: IndicatorConfiguration = .init()  {
        didSet {
            indicatorView.foregroundColor = indicatorConfiguration.foregroundColor
            indicatorView.size = indicatorConfiguration.size
        }
    }
 
    private var messageConfiguration: MessageConfiguration = .init() {
        didSet {
            messageLabel.textColor = messageConfiguration.color
            messageLabel.font = messageConfiguration.font
            messageLabel.textAlignment = messageConfiguration.alignment
            configureLayout()
            
            stackView.axis = messageConfiguration.position.axis
            stackView.spacing = messageConfiguration.spacing
        }
    }
    
    private var containerConfiguration: ContainerConfiguration = .init() {
        didSet {
            containerView.apply(configuration: containerConfiguration)
            
            leadingConstraint?.constant = containerConfiguration.padding.edgeInsets.left
            trailingConstraint?.constant = containerConfiguration.padding.edgeInsets.right
            topConstraint?.constant = containerConfiguration.padding.edgeInsets.top
            bottomConstraint?.constant = containerConfiguration.padding.edgeInsets.bottom
            
            updateConstraintsIfNeeded()
            layoutIfNeeded()
        }
    }
    
    // MARK: - View properties
    
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    private var parentView: UIView?
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var indicatorView : IndicatableView = {
        let view = indicatorConfiguration.view.baseView
        view.translatesAutoresizingMaskIntoConstraints = false
        return indicatorConfiguration.view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var style: LoadingIndicatorStyle = .indicator
    
    // MARK: - Init
        
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = overlayColor ?? UIColor.black.withAlphaComponent(0.2)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Loadable methods
    
    /// Add loading view to parent view with loading indicator style
    /// - Parameter parentView: Parent view to add loading view
    /// - Parameter style: Loading indicator style, default is `indicator`
    public func add(in parentView: UIView, style: LoadingIndicatorStyle = .indicator) {
        
        self.style = style
        
        configuration = LoaderConfiguration.standard
        
        setupViews()
        
        self.parentView = parentView
    }
    
    private func startLoading() {
        // Add loading view
        if let parentView = self.parentView {
            add(parent: parentView, fit: .fill)
        }
       
        if style.componentVisibility.showIndicator {
            // Start animation
            indicatorView.start()
        }
        
        sendActions(for: .valueChanged)
    }
    
    private func stopLoading() {
        if style.componentVisibility.showIndicator {
            // Stop animation
            indicatorView.stop()
        }
        
        sendActions(for: .valueChanged)
                
        // Remove loading view
        removeFromSuperview()
    }
    
    // MARK: - View setup
    
    private func setupViews() {
        
        addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        containerView.addSubview(stackView)
        
        leadingConstraint = stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerConfiguration.padding.edgeInsets.left)
        leadingConstraint?.isActive = true
        trailingConstraint = stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -containerConfiguration.padding.edgeInsets.right)
        trailingConstraint?.isActive = true
        topConstraint = stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerConfiguration.padding.edgeInsets.top)
        topConstraint?.isActive = true
        bottomConstraint = stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -containerConfiguration.padding.edgeInsets.bottom)
        bottomConstraint?.isActive = true
        
        configureLayout()
    }
    
    private func configureLayout() {
        
        stackView.removeArrangedSubview(indicatorView.baseView)
        stackView.addArrangedSubview(indicatorView.baseView)
                
        let position = messageConfiguration.position.indexPosition
    
        stackView.removeArrangedSubview(messageLabel)
        stackView.insertArrangedSubview(messageLabel, at: position)
        
        stackView.spacing = messageConfiguration.spacing
        stackView.axis = messageConfiguration.position.axis
        
        messageLabel.isHidden = !style.componentVisibility.showMessage
        indicatorView.baseView.isHidden = !style.componentVisibility.showIndicator
        
        let configuration = style.componentVisibility.showContainer ? containerConfiguration : ContainerConfiguration.none
        layoutIfNeeded()
        containerView.apply(configuration: configuration)
    }
    
    // MARK: - Actions
    
    /// Action that will be triggered when the loading indicator is changed
    /// - Parameter completion: Closure that will be called when the loading indicator is changed
    @available(iOS 14.0, *)
    public func onValueChanged(completion: @escaping (Bool) -> Void) {
        self.addAction(UIAction(handler: { [weak self] _ in
            completion(self?.isLoading ?? false)
        }), for: .valueChanged)
    }
}
