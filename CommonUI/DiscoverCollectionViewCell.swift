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
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = Colors.transparentTitleLabel
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let recipeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = Colors.secondaryLabel
        label.numberOfLines = 2
        label.layer.zPosition = 1
        label.translatesAutoresizingMaskIntoConstraints = false
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
}
