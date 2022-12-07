//
//  CollectionView.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 13.11.2022.
//

import UIKit

/// Collection view with overriding `contentSize` and `intrinsicContentSize` properties to show it inside `UIScrollView`.
///
/// Problem: it is impossible to show `UICollectionView` inside `UIScrollView` without setting the exact height using `heightAnchor`.
/// This class solves this problem without setting additional constraint, because we could not know how many rows will be in a collection view.
public final class CollectionView: UICollectionView {
    
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
