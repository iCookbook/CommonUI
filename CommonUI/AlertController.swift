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
    
    private lazy var upperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissThisVC))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    private lazy var containterView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemBackground
        view.layer.cornerRadius = 28
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissThisVC))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        return view
    }()
    
    private let imageContainterView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.systemBackground
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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.errorTitle()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.subtitle()
        label.textColor = Colors.secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Texts.Errors.close, for: .normal)
        button.titleLabel?.font = Fonts.buttonTitle()
        button.backgroundColor = Colors.systemGroupedBackground
        button.layer.cornerRadius = 12
        button.tintColor = Colors.label
        button.addTarget(self, action: #selector(dismissThisVC), for: .touchUpInside)
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
    
    @objc private func dismissThisVC() {
        dismiss(animated: true)
    }
    
    private func setupView() {
        view.addSubview(upperView)
        view.addSubview(containterView)
        containterView.addSubview(titleLabel)
        titleLabel.text = heading
        containterView.addSubview(subtitleLabel)
        subtitleLabel.text = message
        containterView.addSubview(closeButton)
        
        if let image = image {
            containterView.addSubview(imageContainterView)
            imageContainterView.addSubview(imageBackgroundView)
            imageBackgroundView.addSubview(iconImageView)
            iconImageView.image = image
            
            NSLayoutConstraint.activate([
                containterView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.size.height * 0.02),
                
                imageContainterView.topAnchor.constraint(equalTo: containterView.topAnchor),
                imageContainterView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor),
                imageContainterView.leadingAnchor.constraint(equalTo: containterView.leadingAnchor),
                imageContainterView.trailingAnchor.constraint(equalTo: containterView.trailingAnchor),
                
                imageBackgroundView.centerXAnchor.constraint(equalTo: imageContainterView.centerXAnchor),
                imageBackgroundView.centerYAnchor.constraint(equalTo: imageContainterView.centerYAnchor, constant: 8),
                imageBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.142),
                imageBackgroundView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.142),
                
                iconImageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
                iconImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
                iconImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            ])
        } else {
            /// Set small height when image was not provided.
            containterView.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.3).isActive = true
        }
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: view.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            containterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            containterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            titleLabel.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -view.frame.size.height * 0.03 + 8),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            subtitleLabel.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            subtitleLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -view.frame.size.height * 0.03 + 6),
            
            closeButton.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: view.frame.size.height * 0.03),
            closeButton.trailingAnchor.constraint(equalTo: containterView.trailingAnchor, constant: -view.frame.size.height * 0.03),
            closeButton.bottomAnchor.constraint(equalTo: containterView.bottomAnchor, constant: -view.frame.size.height * 0.03),
            closeButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
