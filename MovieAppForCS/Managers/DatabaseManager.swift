//
//  DatabaseManager.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 15.02.2023.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()

    private let database = Firestore.firestore()

    private init() { }
    
}
