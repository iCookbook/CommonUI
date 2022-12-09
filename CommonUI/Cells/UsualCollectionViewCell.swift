//
//  UsualCollectionViewCell.swift
//  Discover
//
//  Created by Егор Бадмаев on 31.10.2022.
//

import UIKit
import Models
import Resources

public final class UsualCollectionViewCell: DiscoverCollectionViewCell {
    
    // MARK: - Life Cycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        recipeImageView.image = nil
        recipeTitleLabel.text = ""
        recipeSubtitleLabel.text = ""
    }
    
    public override func setupView() {
        super.setupView()
        
        contentView.addSubview(recipeSubtitleLabel)
        contentView.addSubview(recipeTitleLabel)
        contentView.addSubview(recipeImageView)
        
        NSLayoutConstraint.activate([
            recipeSubtitleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: contentView.layoutMargins.top),
            recipeSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            recipeSubtitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right),
            
            recipeTitleLabel.topAnchor.constraint(equalTo: recipeSubtitleLabel.bottomAnchor, constant: contentView.layoutMargins.bottom / 3),
            recipeTitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            recipeTitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right),
            
            recipeImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 80),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(with data: Recipe) {
        recipeImageView.setImage(by: data.imageData)
        recipeTitleLabel.text = data.label
        recipeSubtitleLabel.text = data.source
        recipeSubtitleLabel.textColor = Colors.secondaryLabel
    }
}
