//
//  IngredientsTableView.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 07.11.2022.
//

import UIKit

/// Table view with overriding `contentSize` and `intrinsicContentSize` properties to show table view inside `UIScrollView`.
///
/// Problem: it is impossible to show `UITableView` inside `UIScrollView` without setting the exact height using `heightAnchor`.
/// This class solves this problem without setting additional constraint, because we could not know how many rows will be in a table view.
public final class NonScrollableTableView: UITableView {
    
    // MARK: - Init
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .clear
        allowsSelection = false
        isScrollEnabled = false
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Properties
    
    /// This code allows to set table view `contentSize` correctly, so there's no need for setting `heightAnchor` in constraints inside `UIScrollView`
    public override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
