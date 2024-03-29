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
    case account = 2
}

enum TabElementTitle: String {
    case search = "Search"
    case home = "Popular"
    case account = "Account"
    case profile = "Profile"
}

enum TabElementImage {
    case search
    case home
    case account
    case profile

    var image: UIImage {
        switch self {
        case .search: return UIImage(systemName: "magnifyingglass")!
        case .home: return UIImage(systemName: "flame")!
        case .account: return UIImage(systemName: "person")!
        case .profile: return UIImage(systemName: "person.fill")!
        }
    }
}

class TabBar: UITabBarController {
    private let isSigendIn = AuthManager.shared.isSignedIn

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.accessibilityIdentifier = UIAccessibleIdentifiers.TabBar.tabBar
        setupVCs()
    }

    private func createNavController(for rootViewController: UIViewController,
        title: String,
        image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationItem.largeTitleDisplayMode = .always
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }

    func setupVCs() {
        viewControllers = [
            createNavController(for: SearchVC(), title: NSLocalizedString(TabElementTitle.search.rawValue, comment: ""), image: TabElementImage.search.image),
            createNavController(for: MovieVC(), title: NSLocalizedString(TabElementTitle.home.rawValue, comment: ""), image: TabElementImage.home.image),

            createNavController(for: isSigendIn ? ProfileVC() : AccountVC(), title: isSigendIn ? NSLocalizedString(TabElementTitle.profile.rawValue, comment: "") : NSLocalizedString(TabElementTitle.account.rawValue, comment: ""), image: isSigendIn ? TabElementImage.profile.image : TabElementImage.account.image)
        ]
    }
}
