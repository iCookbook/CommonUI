//
//  LoadingCollectionViewFooter.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 04.11.2022.
//

import UIKit

public final class LoadingCollectionViewFooter: UICollectionReusableView {
    
    // MARK: - Private Properties
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    public func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
