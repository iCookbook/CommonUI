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
    public var image: UIImage?
    
    // MARK: - Private Properties
    
    private let containterView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemBackground
        view.layer.cornerRadius = 28
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemGroupedBackground
        view.layer.cornerRadius = 28
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
        let button = UIButton(type: .system)
        button.setTitle(Texts.Errors.close, for: .normal)
        button.titleLabel?.font = Fonts.buttonTitle()
        button.backgroundColor = Colors.systemGroupedBackground
        button.layer.cornerRadius = 12
        button.tintColor = Colors.label
        button.addTarget(self, action: #selector(handleCloseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    public init(title: String, message: String, image: UIImage?) {
        heading = title
        self.message = message
        self.image = image
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
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseInOut, .transitionCrossDissolve]) {
            self.view.backgroundColor = Colors.dimmedBackground
        }
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.transitionCrossDissolve]) {
            self.view.backgroundColor = .clear
        }
    }
    
    // MARK: - Private Methods
    
    @objc private func handleCloseButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupView() {
        view.addSubview(containterView)
        
        if let image = image {
            containterView.addSubview(imageBackgroundView)
            imageBackgroundView.addSubview(iconImageView)
            iconImageView.image = image
            
            NSLayoutConstraint.activate([
                imageBackgroundView.centerXAnchor.constraint(equalTo: containterView.centerXAnchor),
                imageBackgroundView.topAnchor.constraint(equalTo: containterView.topAnchor, constant: view.frame.size.height * 0.05),
                imageBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.142),
                imageBackgroundView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.142),
                
                iconImageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
                iconImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
                iconImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            ])
        }
        
        containterView.addSubview(titleLabel)
        titleLabel.text = heading
        containterView.addSubview(subtitleLabel)
        subtitleLabel.text = message
        containterView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            containterView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.size.height * 0.02),
            containterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            containterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            containterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            titleLabel.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -view.frame.size.height * 0.03 + 4),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            subtitleLabel.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            subtitleLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -view.frame.size.height * 0.03 - 4),
            
            closeButton.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            closeButton.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            closeButton.bottomAnchor.constraint(equalTo: containterView.bottomAnchor, constant: -view.frame.size.height * 0.03),
            closeButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
