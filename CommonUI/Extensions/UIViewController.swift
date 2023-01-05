//
//  UIViewController.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 26.12.2022.
//

import UIKit

extension UIViewController {
    
    /// Shows custom alert controller.
    ///
    /// - Parameters:
    ///   - title: error title.
    ///   - message: error message.
    ///   - image: optional error image.
    open func showAlert(title: String, message: String, image: UIImage?) {
        let alertController = AlertController(title: title, message: message, image: image)
        alertController.modalPresentationStyle = .custom
        present(alertController, animated: true)
    }
    
    /// Allows to hide keyboard when user taps around by using `UITapGestureRecognizer` with action `dismissKeyboard` defined lower.
    public func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
