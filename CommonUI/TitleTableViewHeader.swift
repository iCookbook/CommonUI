//
//  TitleTableViewHeader.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 10.11.2022.
//

import UIKit
import Resources

public final class TitleTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.title()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let additionalButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, additionalButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
//        stackView.alignment = .lastBaseline
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure(title: String, buttonTitle: String? = nil) {
        titleLabel.text = title
        
        if let buttonTitle = buttonTitle {
            additionalButton.setTitle(buttonTitle, for: .normal)
            additionalButton.isHidden = false
        }
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        contentView.backgroundColor = Colors.systemBackground
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.layoutMargins.left * 2),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.layoutMargins.right * 2),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.layoutMargins.top),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.layoutMargins.bottom),
        ])
    }
}
