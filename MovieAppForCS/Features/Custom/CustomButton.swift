//
//  CustomButton.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 1.12.2022.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(color: UIColor, title: String, systemImageName: String) {
        super.init(frame: .zero)
        
        configuration = .tinted()
        configuration?.title = title

        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color

        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false

        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 10
        configuration?.imagePlacement = .trailing
    }
}
