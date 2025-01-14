//
//  RecipeCollectionViewCell.swift
//  Discover
//
//  Created by Егор Бадмаев on 31.10.2022.
//

import UIKit
import Models
import Resources

public final class RecipeCollectionViewCell: DiscoverCollectionViewCell {
    
    // MARK: - Private Properties
    
    private let recipeTertiaryLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.systemBody()
        label.textColor = .white
        label.numberOfLines = 2
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: - Life Cycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        recipeImageView.image = nil
        recipeTitleLabel.text = ""
        recipeSubtitleLabel.text = ""
        recipeTertiaryLabel.text = ""
    }
    
    public override func setupView() {
        super.setupView()
        
        [recipeSubtitleLabel, recipeTitleLabel, recipeTertiaryLabel, recipeImageView].forEach {
            contentView.addSubview($0)
        }
        
        addShadows(to: recipeTitleLabel, opacity: 0.25)
        addShadows(to: recipeSubtitleLabel, opacity: 0.6)
        addShadows(to: recipeTertiaryLabel, opacity: 0.4)
        
        NSLayoutConstraint.activate([
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            recipeSubtitleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: contentView.layoutMargins.top),
            recipeSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            recipeSubtitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right),
            
            recipeTitleLabel.topAnchor.constraint(equalTo: recipeSubtitleLabel.bottomAnchor, constant: contentView.layoutMargins.bottom / 2),
            recipeTitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            recipeTitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right),
            
            recipeTertiaryLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -contentView.layoutMargins.bottom),
            recipeTertiaryLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: contentView.layoutMargins.left),
            recipeTertiaryLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -contentView.layoutMargins.right)
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(with data: Recipe) {
        recipeImageView.setImage(by: data.imageData)
        recipeTitleLabel.text = data.label
        recipeTitleLabel.textColor = .white
        recipeSubtitleLabel.text = data.source
        
        let totalTime = data.totalTime != 0.0 ? Int(data.totalTime ?? 50.0) : 50
        let yield = data.yield != 0.0 ? Int(data.yield ?? 4.0) : 4
        recipeTertiaryLabel.text = "\(Texts.Discover.cookingTime): \(totalTime) \(Texts.RecipeDetails.minutes(count: totalTime)), \(Texts.Discover.servingsCount.lowercased()): \(yield)"
    }
}
