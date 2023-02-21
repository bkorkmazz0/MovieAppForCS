//
//  StorageManager.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 15.02.2023.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    
    private let container = Storage.storage().reference()
    
    private init() { }

}
