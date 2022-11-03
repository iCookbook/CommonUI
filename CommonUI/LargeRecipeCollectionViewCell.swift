//
//  LargeRecipeCollectionViewCell.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 31.10.2022.
//

import UIKit
//import Models
import Resources

public final class LargeRecipeCollectionViewCell: DiscoverCollectionViewCell {
    
    // MARK: - Private Properties
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    private let recipesDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dishOfTheDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = Colors.transparentTitleLabel
        label.text = Texts.Discover.dishOfTheDay
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Private Methods
    
    public override func setupView() {
        super.setupView()
        
        //        [recipeImageView, recipeTitleLabel, recipeSubtitleLabel, recipeTertiaryLabel].forEach {
        //            contentView.addSubview($0)
        //        }
        //
        //        NSLayoutConstraint.activate([
        //
        //        ])
    }
    
    // MARK: - Public Methods
    
//    public func configure(with data: Recipe?, dishOfTheDayLabelIsHidden: Bool) {
//        dishOfTheDayLabel.isHidden = dishOfTheDayLabelIsHidden
//        dishOfTheDayLabel.text = Texts.Discover.dishOfTheDay
//
//        recipeTitleLabel.text = data?.label
//        recipeSubtitleLabel.text = "Bring colour to your dinner table with our \(data?.label). Packed with nutrients, it's a satisfying veggie lunch or supper for the family"
//    }
}
