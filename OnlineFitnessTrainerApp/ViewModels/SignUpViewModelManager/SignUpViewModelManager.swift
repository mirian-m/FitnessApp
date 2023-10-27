//
//  SignUpViewModelManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/19/23.
//

import Foundation

final class SignUpViewModelManager: LogInProtocol {
    public var error: ObservableObject<String> = ObservableObject("")
    
    func signUpWith(email: String, password: String) {
        FirebaseService.shared.createUserWith(email: email, password: password) { [weak self] error in
            DispatchQueue.main.async {
                self?.error.value = error?.localizedDescription
            }
        }
    }
    
    func saveUserData() {
        let userData = UserDataService.shared.userInfo
        FirebaseService.shared.save(userData.transform())
    }
}
