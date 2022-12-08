//
//  PopUpViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 7.12.2022.
//

import UIKit
import SnapKit

private class PopupWindowView: UIView {

    let popupView: UIView = UIView(frame: .zero)
    let popupLabel: UILabel = UILabel(frame: .zero)
    let popupTextView: UITextView = UITextView(frame: .zero)
    let popupButton = UIButton(frame: CGRect.zero)
    let borderWidth: CGFloat = 2.0

    init() {
        super.init(frame: .zero)
        backgroundColor = .black.withAlphaComponent(0.5)

        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.backgroundColor = .systemGray5
        popupView.layer.borderWidth = borderWidth
        popupView.layer.borderColor = UIColor.white.cgColor
        popupView.layer.cornerRadius = 15
        popupView.layer.masksToBounds = true

        popupLabel.translatesAutoresizingMaskIntoConstraints = false
        popupLabel.textColor = .black
        popupLabel.layer.masksToBounds = true
        popupLabel.adjustsFontSizeToFitWidth = true
        popupLabel.clipsToBounds = true
        popupLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        popupLabel.numberOfLines = 1
        popupLabel.textAlignment = .center

        popupTextView.translatesAutoresizingMaskIntoConstraints = false
        popupTextView.textAlignment = .left
        popupTextView.textColor = .black
        popupTextView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        popupButton.setTitleColor(.white, for: .normal)
        popupButton.backgroundColor = .systemGreen
//        popupButton.configuration = .tinted()
//        popupButton.configuration?.baseForegroundColor = .systemGreen
//        popupButton.configuration?.baseBackgroundColor = .systemGreen

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

class PopupWindowViewController: UIViewController {

    private let popupView = PopupWindowView()

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
        self.dismiss(animated: true, completion: nil)
        popupView.popupTextView.text = ""
        makeToast()
    }

    func makeToast() {
        let toast = UIAlertController(title: "-----------", message: "Thank you for rating the product.", preferredStyle: .alert)
        self.present(toast, animated: true, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            toast.dismiss(animated: true, completion: nil)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
