//
//  TitleCollectionViewHeader.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 13.11.2022.
//

import UIKit
import Resources

#warning("Этот класс нигде не используется")
public final class TitleCollectionViewHeader: UICollectionReusableView {
    
    // MARK: - Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.Search.recommended
        label.font = Fonts.title()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = Colors.systemBackground
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: layoutMargins.left * 2),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -layoutMargins.left * 2),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -layoutMargins.bottom)
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
