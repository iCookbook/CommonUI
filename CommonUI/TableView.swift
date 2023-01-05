//
//  TableView.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 07.11.2022.
//

import UIKit

/// Table view with overriding `contentSize` and `intrinsicContentSize` properties to show table view inside `UIScrollView`.
///
/// Problem: it is impossible to show `UITableView` inside `UIScrollView` without setting the exact height using `heightAnchor`.
/// This class solves this problem without setting additional constraint, because we could not know how many rows will be in a table view.
public final class TableView: UITableView {
    
    // MARK: - Init
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        backgroundColor = .clear
        isScrollEnabled = false
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
