//
//  FirebaseManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/19/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class FirebaseService {
    
    // MARK:- Shared property
    static let shared = FirebaseService()
    // MARK:- Private Property
    private let db = Firestore.firestore()
    
    func createUserWith(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (_, error) in
            completion(error)
        }
    }
    
    func signInWith(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
            completion(error)
        }
    }
    
    func save(_ data: [String: Any], completion: @escaping (Result<Any?, Error>) -> Void) {
        self.db.collection(Const.FStore.collection).addDocument(data: data) { error in
            if let err = error {
                completion(.failure(err))
            } else {
                completion(.success("Document successfully written!"))
            }
        }
    }
}
