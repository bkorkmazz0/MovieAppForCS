//
//  CustomToastMessage.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 9.12.2022.
//

import UIKit
import SnapKit

extension UIViewController {

    func showToast(message: String, seconds: Double, color: UIColor, style: UIAlertController.Style) {

        let alert = UIAlertController(title: nil, message: message, preferredStyle: style)
        alert.view.layer.cornerRadius = 20
        alert.view.clipsToBounds = true
        alert.view.backgroundColor = color

        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
