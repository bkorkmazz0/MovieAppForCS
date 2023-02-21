//
//  ProfileVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 24.01.2023.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "person.circle")
//        imageView.tintColor = .gray
//        imageView.contentMode = .scaleAspectFit
//        imageView.layer.masksToBounds = true
//        imageView.layer.borderWidth = 2
//        imageView.layer.borderColor = UIColor.lightGray.cgColor
//        return imageView
//    }()
    
    //viewdidload
    
//    imageView.frame = CGRect(x: (scrollView.width - size) / 2, y: 20, width: size, height: size)
    //        imageView.layer.cornerRadius = imageView.width / 2.0
    
    //        scrollView.isUserInteractionEnabled = true
    //        imageView.isUserInteractionEnabled = true
    //        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
    //        imageView.addGestureRecognizer(gesture)
    
    //    @objc private func didTapChangeProfilePic() {
    //        presentPhotoActionSheet()
    //    }
    
//    extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//        func presentPhotoActionSheet() {
//            let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
//            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//            actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
//                self?.presentCamera()
//            }))
//            actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
//                self?.presentPhotoPicker()
//            }))
//
//            present(actionSheet, animated: true)
//        }
//
//        func presentCamera() {
//            let vc = UIImagePickerController()
//            vc.sourceType = .camera
//            vc.delegate = self
//            vc.allowsEditing = true
//            present(vc, animated: true)
//        }
//
//        func presentPhotoPicker() {
//            let vc = UIImagePickerController()
//            vc.sourceType = .photoLibrary
//            vc.delegate = self
//            vc.allowsEditing = true
//            present(vc, animated: true)
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            picker.dismiss(animated: true)
//            guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
//            self.imageView.image = selectedImage
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }

    
    
    
    
    
    
    

    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)

        view.addSubview(logoutButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        logoutButton.frame = CGRect(x: CGFloat.deviceWidth / 2, y: CGFloat.deviceHeight / 2, width: 102, height: 52)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }

    @objc private func logoutButtonTapped() {

        let actionSheet = UIAlertController(title: "", message: "Do you want to logout?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in

            guard let self = self else {
                return
            }
            
            do {
                try FirebaseAuth.Auth.auth().signOut()

                let vc = SignInVC()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
    }

    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = SignInVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
}
