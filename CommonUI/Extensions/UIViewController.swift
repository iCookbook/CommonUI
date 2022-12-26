//
//  UIViewController.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 26.12.2022.
//

import UIKit

extension UIViewController {
    open func showAlert(title: String, message: String, image: UIImage?) {
        let alertController = AlertController(title: title, message: message, image: image)
        alertController.modalPresentationStyle = .custom
        present(alertController, animated: true)
    }
}
