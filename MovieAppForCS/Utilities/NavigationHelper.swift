//
//  NavigationHelper.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 24.01.2023.
//

import UIKit

enum TabElementIndex: Int {
    case search = 0
    case home = 1
    case profile = 2
}

enum TabElementTitle: String {
    case search = "Search"
    case home = "Popular"
    case profile = "Profile"
}

enum TabElementImage {
    case search
    case home
    case profile

    var image: UIImage {
        switch self {
        case .search: return UIImage(systemName: "magnifyingglass")!
        case .home: return UIImage(systemName: "flame")!
        case .profile: return UIImage(systemName: "person")!
        }
    }
}

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.layer.shadowColor = UIColor.systemGray5.cgColor
        setupVCs()
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
        title: String,
        image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }

    func setupVCs() {
        viewControllers = [
            createNavController(for: SearchVC(), title: NSLocalizedString(TabElementTitle.search.rawValue, comment: ""), image: TabElementImage.search.image),
            createNavController(for: MovieVC(), title: NSLocalizedString(TabElementTitle.home.rawValue, comment: ""), image: TabElementImage.home.image),
            createNavController(for: ProfileVC(), title: NSLocalizedString(TabElementTitle.profile.rawValue, comment: ""), image: TabElementImage.profile.image)
        ]
    }
}
