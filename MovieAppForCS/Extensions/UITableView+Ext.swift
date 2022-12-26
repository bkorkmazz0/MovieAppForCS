//
//  UITableView+Ext.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 26.12.2022.
//

import UIKit

extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
