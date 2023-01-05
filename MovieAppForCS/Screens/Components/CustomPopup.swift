//
//  CustomPopup.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 7.12.2022.
//

import UIKit
import SnapKit

private final class CustomPopupView: UIView {

    let popupView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupView
        return view
    }()

    let popupLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.masksToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupLabel
        return label
    }()

    let popupTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.textAlignment = .left
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textView.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupTextView
        return textView
    }()

    lazy var popupButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.accessibilityIdentifier = UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupButton
        return button
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .black.withAlphaComponent(0.3)

        addSubview(popupView)
        popupView.addSubview(popupLabel)
        popupView.addSubview(popupTextView)
        popupView.addSubview(popupButton)

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
