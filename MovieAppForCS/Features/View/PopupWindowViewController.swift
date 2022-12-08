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
        // Semi-transparent background
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
        popupButton.setTitleColor(.white, for: .normal)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        popupButton.backgroundColor = .systemGreen

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

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen

        popupView.popupLabel.text = title
        popupView.popupButton.setTitle(buttonText, for: .normal)
        popupView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        view = popupView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
        let toast = UIAlertController(title: "You're gooood :)", message: "make comment", preferredStyle: .alert)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.present(toast, animated: true, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            toast.dismiss(animated: true, completion: nil)        }
    }
}
