//
//  UIImaveView.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 09.12.2022.
//

import UIKit
import Resources

extension UIImageView {
    public func setImage(by data: Data?) {
        if let data = data {
            self.image = UIImage(data: data)
        } else {
            self.image = Resources.Images.sampleRecipeImage
        }
    }
}
