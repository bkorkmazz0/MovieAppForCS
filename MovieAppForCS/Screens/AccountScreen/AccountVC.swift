//
//  AccountVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 11.02.2023.
//

import UIKit
import SnapKit

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
