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
        return label
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
    
    public func configure(title: String) {
        titleLabel.text = title
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        contentView.backgroundColor = Colors.systemBackground
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.layoutMargins.left * 2),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: contentView.layoutMargins.right * 2),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.layoutMargins.bottom)
        ])
    }
}
