//
//  LargeRecipeCollectionViewCell.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 31.10.2022.
//

import UIKit
import Models
import Resources

public final class LargeRecipeCollectionViewCell: DiscoverCollectionViewCell {
    
    // MARK: - Private Properties
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.layer.zPosition = 1
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private let dishOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .black)
        label.textColor = .white
        label.text = Texts.Discover.dishOfTheDay
        label.numberOfLines = 2
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        recipeImageView.image = nil
        recipeTitleLabel.text = ""
        recipeSubtitleLabel.text = ""
        dishOfTheDayLabel.text = ""
    }
    
    public override func setupView() {
        super.setupView()
        
        contentView.addSubview(recipeImageView)
        contentView.addSubview(dishOfTheDayLabel)
        addShadows(to: dishOfTheDayLabel, opacity: 1.0)
        
        contentView.addSubview(blurEffectView)
        contentView.addSubview(recipeTitleLabel)
        recipeTitleLabel.textColor = .white
        contentView.addSubview(recipeSubtitleLabel)
        recipeSubtitleLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            recipeImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            dishOfTheDayLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            dishOfTheDayLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            dishOfTheDayLabel.bottomAnchor.constraint(equalTo: blurEffectView.topAnchor, constant: -layoutMargins.bottom),
            
            blurEffectView.heightAnchor.constraint(equalToConstant: 90),
            blurEffectView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            recipeTitleLabel.topAnchor.constraint(equalTo: blurEffectView.topAnchor, constant: layoutMargins.top),
            recipeTitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            recipeTitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            
            recipeSubtitleLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor, constant: layoutMargins.top / 2),
            recipeSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            recipeSubtitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            
        ])
    }
    
    // MARK: - Public Methods
    
    public func configure(with data: Recipe) {
        recipeImageView.loadImage(for: data.images?.regular?.url)
        dishOfTheDayLabel.text = Texts.Discover.dishOfTheDay
        
        recipeTitleLabel.text = data.label
        recipeSubtitleLabel.text = "Bring colour to your dinner table with our \(data.label ?? Texts.Discover.mockRecipeTitle). Packed with nutrients, it's a satisfying veggie lunch or supper for the family"
    }
}
