//
//  UIAlertController.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 06.01.2023.
//

import UIKit

extension UIAlertController {
    
    /// This method is needed so that the console no longer displays an error about the allegedly negative width on iOS 12 and 13.
    public func negativeWidthConstraint() {
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}