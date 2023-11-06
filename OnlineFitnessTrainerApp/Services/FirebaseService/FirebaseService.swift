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
    
    private init() {}
    
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
    
    func save(_ data: [String: Any]) {
        guard let signInedUserId = Auth.auth().currentUser?.uid else { return }
        db.collection(Const.FStore.collection).document(signInedUserId).setData(data)
    }
    
    func getLoginedUserData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        db.collection(Const.FStore.collection).document(userId).getDocument { snapshot, error in
            //FIXME:-  Transform in user data model
            print(snapshot?.data() as Any)
        }
    }
}
