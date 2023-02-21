//
//  SignUpVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 5.02.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class SignUpVC: UIViewController {

    // MARK: - UI Elements
    private let headerView = SignHeaderView()

    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field .placeholder = "First Name..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()

    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field .placeholder = "Last Name..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()

    private let emailField: UITextField = {
        let field = UITextField()
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.masksToBounds = true
        field .placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white

        field.text = "berkan@gmail.com"
        return field
    }()

    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.masksToBounds = true
        field .placeholder = "Password.."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true

        field.text = "password"
        return field
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.largeTitleDisplayMode = .never

        view.addSubview(headerView)
        view.addSubview(firstNameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)

        configureSetupUIs()

        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)

        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarShow(isHidden: true, animation: false, alpha: 0)
    }
}

// MARK: - Functions
extension SignUpVC {
    func configureSetupUIs() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.height / 4)
        }

        firstNameField.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }

        lastNameField.snp.makeConstraints { make in
            make.top.equalTo(firstNameField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }

        emailField.snp.makeConstraints { make in
            make.top.equalTo(lastNameField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }

        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }

    func alertUserSignUpError() {
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to create a new account.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }

    @objc func didTapSignUpButton() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()

        guard let firstName = firstNameField.text, let lastName = lastNameField.text, let email = emailField.text, let password = passwordField.text, !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserSignUpError()
            return
        }

        AuthManager.shared.signUp(email: email, password: password) { [weak self] success in
            DispatchQueue.main.async {
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if success {
                        let vc = TabBar()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    } else {
                        print("Error creating user")
                    }
                }
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        } else if textField == lastNameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            didTapSignUpButton()
        }
        return true
    }
}
