//
//  Protocols.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import UIKit

protocol Listener: AnyObject {
    func buttonPressd(_ sender: UIButton?)
}

protocol DataValidatableProtocol {
    associatedtype T
    func checkValidationeOf(_ data: T) -> Error?
}

protocol UpdatebleProtocol {
    func updateAge(_ age: Int)
    func updateName(_ name: String)
    func updateLastName(_ lastName: String)
    func updateMail(_ mail: String)
    func updateGender(_ gender: Gender)
    func updateWeight(_ weight: Int)
    func updateHeight(_ height: Int)
    func updateGoal(_ goal: [Goal]?)
    func updatePhoneNumber(_ phoneNumber: String)
    func updatePhysicalActivity(_ level: ActivityLevel)
    func updatePicture(_ picture: Data)
}

@objc protocol LogInProtocol {
    @objc optional func logInWith(email: String, password: String)
    @objc optional func signUpWith(email: String, password: String)
}

extension LogInProtocol {
    func logInWithFacebook() { print("FaceBook log in") }
    func logInWithGoogle() { print("Google log in") }
    func logInWithApple() { print("App log in") }
}
