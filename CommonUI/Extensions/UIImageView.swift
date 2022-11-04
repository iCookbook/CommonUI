//
//  UIImageView.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 04.11.2022.
//

import UIKit
import Resources
import Networking

extension UIImageView {
    public func loadImage(for urlString: String?) {
        NetworkManager.obtainData(by: urlString ?? "") { [weak self] (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self?.image = Images.sampleRecipeImage
                }
            }
        }
    }
}
