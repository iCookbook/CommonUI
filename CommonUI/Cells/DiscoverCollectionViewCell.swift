//
//  DiscoverCollectionViewCell.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 31.10.2022.
//

import UIKit
import Resources

open class DiscoverCollectionViewCell: UICollectionViewCell {
    
    public let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.title()
        label.textColor = Colors.transparentTitleLabel
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    public let recipeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.subtitle()
        label.textColor = Colors.lightSecondaryLabel
        label.numberOfLines = 2
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: - Init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupView() {
        contentView.backgroundColor = Colors.systemGroupedBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
    }
    
    public func addShadows(to label: UILabel, opacity: Float) {
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 1.0
        label.layer.shadowOpacity = opacity
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.masksToBounds = false
    }
}
