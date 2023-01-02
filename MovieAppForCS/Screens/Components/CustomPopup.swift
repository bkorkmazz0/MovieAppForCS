//
//  PopUpViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 7.12.2022.
//

import UIKit
import SnapKit

private class CustomPopupView: UIView {

    let popupView = UIView()
    let popupLabel = UILabel()
    let popupTextView = UITextView()
    let popupButton = UIButton()

    init() {
        super.init(frame: .zero)
        backgroundColor = .black.withAlphaComponent(0.4)

        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.backgroundColor = .systemGray5
        popupView.layer.borderWidth = 2
        popupView.layer.borderColor = UIColor.white.cgColor
        popupView.layer.cornerRadius = 15
        popupView.layer.masksToBounds = true
        popupView.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupView

        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupLabel.textColor = .black
        popupLabel.layer.masksToBounds = true
        popupLabel.adjustsFontSizeToFitWidth = true
        popupLabel.clipsToBounds = true
        popupLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        popupLabel.numberOfLines = 1
        popupLabel.textAlignment = .center
        popupLabel.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupLabel

        popupTextView.translatesAutoresizingMaskIntoConstraints = false
        popupTextView.backgroundColor = .white
        popupTextView.textAlignment = .left
        popupTextView.textColor = .black
        popupTextView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        popupTextView.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupTextView

        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        popupButton.setTitleColor(.white, for: .normal)
        popupButton.backgroundColor = .systemGreen
        popupButton.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupButton

        popupView.addSubview(popupLabel)
        popupView.addSubview(popupTextView)
        popupView.addSubview(popupButton)
        addSubview(popupView)

        popupView.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }

        popupLabel.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }

        popupTextView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(90)
            make.top.equalTo(popupLabel.snp.bottom)
            make.bottom.equalTo(popupButton.snp.top).offset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        popupButton.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol PopupWindowDelegate {
    func didTapPopupButton()
}

class CustomPopupVC: UIViewController {

    private let popupView = CustomPopupView()
    var delegate: PopupWindowDelegate?

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
            showToast(message: "TextView cannot be left blank!", seconds: 1.5, color: .red, style: .alert)
        } else {
            self.dismiss(animated: true, completion: nil)
            popupView.popupTextView.layer.borderWidth = 0
            popupView.popupTextView.text = ""
            delegate?.didTapPopupButton()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
