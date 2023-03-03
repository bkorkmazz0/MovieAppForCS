//
//  CustomPopup.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 7.12.2022.
//

import UIKit

protocol PopupWindowDelegate: AnyObject {
    func didTapPopupButton()
}

final class CustomPopupVC: UIViewController {

    private let popupView = CustomPopupView()
    weak var delegate: PopupWindowDelegate?

    init(title: String, buttonText: String) {
        super.init(nibName: nil, bundle: nil)

        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .overFullScreen

        popupView.popupLabel.text = title
        popupView.popupButton.setTitle(buttonText, for: .normal)
        popupView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        view = popupView
    }

    @objc func dismissView() {
        if popupView.popupTextView.text.isEmpty {
            showToastMessage(message: "TextView cannot be left blank!", seconds: 1.5, color: .red, style: .alert)
        } else {
            self.dismiss(animated: true, completion: nil)
            popupView.popupTextView.text = ""
            delegate?.didTapPopupButton()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
