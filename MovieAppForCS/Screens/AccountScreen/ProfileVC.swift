//
//  ProfileVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 24.01.2023.
//

import UIKit
import SnapKit
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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.prefersLargeTitles = true

        setUpSignOutButton()
    }

    private func setUpSignOutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTapSignOut))
    }

    @objc private func didTapSignOut() {
        let actionSheet = UIAlertController(title: "Sign Out", message: "Are you sure you would like to sign out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut { [weak self] success in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if success {
                        let vc = TabBar()
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc)
                        vc.selectedIndex = TabElementIndex.account.rawValue
//                        self.navigationController?.popToRootViewController(animated: true)
                    } else {
                        print("Error sign out user")
                    }
                }
            }
        }))
        present(actionSheet, animated: true)
    }
}
