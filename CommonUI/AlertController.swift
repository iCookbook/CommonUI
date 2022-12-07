//
//  AlertController.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 03.12.2022.
//

import UIKit
import Resources

public final class AlertController: UIViewController {
    
    // MARK: - Public Properties
    
    public var heading: String
    public var message: String
    
    // MARK: - Private Properties
    
    private let containterView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemGroupedBackground
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.errorTitle()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.subtitle()
        label.textColor = Colors.secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.Errors.close, for: .normal)
        button.titleLabel?.font = Fonts.buttonTitle()
        button.backgroundColor = Colors.systemGroupedBackground
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(handleCloseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    public init(title: String, message: String) {
        heading = title
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Public Methods
    
//    public func setData(title: String, message: String)
    
    // MARK: - Private Methods
    
    @objc private func handleCloseButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupView() {
        view.backgroundColor = Colors.dimmedBackground
        
        view.addSubview(containterView)
        containterView.addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(iconImageView)
        
        containterView.addSubview(titleLabel)
        containterView.addSubview(subtitleLabel)
        containterView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            containterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            containterView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: view.layoutMargins.left / 2),
            containterView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -view.layoutMargins.right / 2),
            containterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: view.layoutMargins.bottom / 2),
            
            imageBackgroundView.centerXAnchor.constraint(equalTo: containterView.centerXAnchor),
            
        ])
    }
}
