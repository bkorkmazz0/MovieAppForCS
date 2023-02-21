//
//  AccountVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 11.02.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class AccountVC: UIViewController {
    private let viewControllers = [SignInVC(), SignUpVC()]
    private let viewControllersTitles = ["Sign In", "Create Account"]
    
    private let imageView = UIImageView(image: UIImage.gifImageWithName("johnny"))

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.AccountCellConstant.accountCellIdentifier.rawValue)

        tableView.layer.cornerRadius = 12
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.masksToBounds = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(imageView)
        view.addSubview(tableView)

        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.snp.centerX)

        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(CGFloat.deviceWidth * 0.2)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tabBarShow(isHidden: false, animation: false, alpha: 1)
    }
}

//        setUpSignOutButton()
//        validateAuth()


//    private func setUpSignOutButton() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTapSignOut))
//    }

//    private func validateAuth() {
//        if FirebaseAuth.Auth.auth().currentUser == nil {
//            let vc = SignInVC()
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: true)
//        }
//    }

#warning("see sign ut button whe you are login")
//    @objc private func didTapSignOut() {
//
//        let actionSheet = UIAlertController(title: "Sign Out", message: "Are you sure you would like to sign out?", preferredStyle: .actionSheet)
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//        actionSheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
//            AuthManager.shared.signOut { [weak self] success in
//                guard let self = self else { return }
//
//                if success {
//                    DispatchQueue.main.async {
//                        let signInVC = SignInVC()
//                        signInVC.navigationItem.largeTitleDisplayMode = .always
//
//                        let navVC = UINavigationController(rootViewController: signInVC)
//                        navVC.navigationBar.prefersLargeTitles = true
//                        navVC.modalPresentationStyle = .fullScreen
//                        self.present(navVC, animated: true)
//                    }
//                }
//            }
//        }))
//        present(actionSheet, animated: true)
//    }

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.AccountCellConstant.accountCellIdentifier.rawValue) as? AccountCell else { return UITableViewCell() }
        cell.textLabel?.text = viewControllersTitles[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVC = viewControllers[indexPath.row]
        navigationController?.pushViewController(selectedVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat.deviceWidth * 0.1
    }
}
