//
//  AccountCell.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 16.02.2023.
//

import Foundation
import UIKit

final class AccountCell: UITableViewCell {
    enum AccountCellConstant: String {
        case accountCellIdentifier = "accountCellIdentifier"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
