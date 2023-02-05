//
//  UIViewController+Extension.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 9.12.2022.
//

import UIKit

extension UIViewController {
    func showToastMessage(message: String, seconds: Double, color: UIColor, style: UIAlertController.Style) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: style)
        alert.view.layer.cornerRadius = 20
        alert.view.clipsToBounds = true
        alert.view.backgroundColor = color

        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

    func tabBarShow(isHidden: Bool, animation: Bool, alpha: CGFloat) {
        if animation == true {
            UIView.animate(withDuration: 0.2, animations: {
                self.tabBarController?.tabBar.alpha = alpha
            })
        } else {
            tabBarController?.tabBar.alpha = alpha
        }
        tabBarController?.tabBar.isHidden = isHidden
    }

    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, title: String, preferredLargeTitle: Bool) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
        navBarAppearance.backgroundColor = backgoundColor
        navBarAppearance.shadowColor = .systemGray5

        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = title
    }
}
