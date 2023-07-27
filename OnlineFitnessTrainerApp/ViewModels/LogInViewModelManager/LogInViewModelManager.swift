//
//  LogInViewModelManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/19/23.
//

import Foundation
import UIKit


final class LogInViewModelManager: GetInProtocol {
    public var error: ObservableObject<String> = ObservableObject("")
    
    func logInWith(email: String, password: String) {
        FirebaseService.shared.signInWith(email: email, password: password) { error in
            DispatchQueue.main.async {[weak self] in
                self?.error.value = error?.localizedDescription
            }
        }
    }
}
