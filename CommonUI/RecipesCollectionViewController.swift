//
//  RecipesCollectionViewController.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 10.11.2022.
//

import UIKit
import Models

/// `UIViewController` with collection view for recipes.
///
/// It has collection view with registered collection view cells:
/// * ``RecipeCollectionViewCell``
/// * ``LargeRecipeCollectionViewCell``
/// * ``UsualCollectionViewCell``
/// And one footer (`UICollectionReusableView`): ``LoadingCollectionViewFooter``
///
/// All properties were made `public` because of inheritance.
open class RecipesCollectionViewController: UIViewController {
    
    // MARK: - Public Properties
    
    /// Array of recipes.
    public var data: [Recipe] = []
    /// Defines whether fetching is in progress. It is being used for pagination.
    public var isFetchingInProgress = false
    /// Link to the next page.
    public var nextPageUrl: String?
    
    /// Activity indicator for displaying loading.
    public let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    /// Collection view with recipes.
    public lazy var recipesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width - 32, height: view.frame.size.height * 0.38)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
        collectionView.register(UsualCollectionViewCell.self, forCellWithReuseIdentifier: UsualCollectionViewCell.identifier)
        collectionView.register(LargeRecipeCollectionViewCell.self, forCellWithReuseIdentifier: LargeRecipeCollectionViewCell.identifier)
        collectionView.register(LoadingCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadingCollectionViewFooter.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Open Methods
    
    /// Turns off all activity indicators and refresh controls, sets `isFetchingInProgress` to default value.
    open func resetAllActivity() {
        activityIndicator.stopAnimating()
        isFetchingInProgress = false
    }
    
    // MARK: - Public Methods
    
    public func fillData(with data: [Recipe], nextPageUrl: String?, withOverridingCurrentData: Bool) {
        if withOverridingCurrentData {
            // first setup or pull to refresh
            self.data = data
        } else {
            // pagination
            self.data.append(contentsOf: data)
        }
        self.nextPageUrl = nextPageUrl
        
        DispatchQueue.main.async {
            // no need to put self in capture list, because DispatchQueue does not capture it
            self.resetAllActivity()
            
            UIView.transition(with: self.recipesCollectionView, duration: 0.5, options: .transitionCrossDissolve, animations: { [unowned self] in
                recipesCollectionView.reloadData()
            })
        }
    }
}

// MARK: - UICollectionView

extension RecipesCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    /// Defined as `public` because we need to override this method in ``DiscoverViewController``.
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeRecipeCollectionViewCell.identifier, for: indexPath) as? LargeRecipeCollectionViewCell else {
            fatalError("Could not cast cell at indexPath \(indexPath) to 'UsualCollectionViewCell' in 'Discover' module")
        }
        cell.configure(with: data[indexPath.row], dishOfTheDayLabelIsHidden: true)
        return cell
    }
    
    /// Defined as `public` because we need to override this method in our view controllers.
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// This method only shrinks recipe cell when it's been tapped.
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        cell.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 1.4, initialSpringVelocity: 0.1, options: .allowUserInteraction, animations: {
            cell.transform = CGAffineTransform.identity
        })
    }
    
    // MARK: Footer
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadingCollectionViewFooter.identifier, for: indexPath) as? LoadingCollectionViewFooter else {
                fatalError("Could not cast to `LoadingCollectionViewFooter` for indexPath \(indexPath) in viewForSupplementaryElementOfKind")
            }
            return footer
        default:
            // empty view
            return UICollectionReusableView()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        switch elementKind {
        case UICollectionView.elementKindSectionFooter:
            guard let footer = view as? LoadingCollectionViewFooter else {
                fatalError("Could not cast to `LoadingCollectionViewFooter` for indexPath \(indexPath) in willDisplaySupplementaryView")
            }
            /// If there is link to the next page, start loading.
            if nextPageUrl != nil {
                footer.startActivityIndicator()
            }
        default:
            break
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        switch elementKind {
        case UICollectionView.elementKindSectionFooter:
            guard let footer = view as? LoadingCollectionViewFooter else {
                fatalError("Could not cast to `LoadingCollectionViewFooter` for indexPath \(indexPath) in didEndDisplayingSupplementaryView")
            }
            footer.stopActivityIndicator()
        default:
            break
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        /// If there is link to the next page, set size for footer, if not, set size for small inset.
        if nextPageUrl != nil {
            return CGSize(width: view.frame.size.width, height: 80)
        } else {
            return CGSize(width: view.frame.size.width, height: 20)
        }
    }
}
