//
//  UserDefaultsManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/30/23.
//

import UIKit

// Create userManager class use singlton design pattern
final class UserDataService: UpdatebleProtocol {
    static let shared = UserDataService()
    private var user = User()
    
    var userInfo: User { self.user }
    
    // MARK:- User Update methods
    func updateAge(_ age: Int) { self.user.age = age }
    
    func updateName(_ name: String) { self.user.name = name }
    
    func updateLastName(_ lastName: String) { user.lastName = lastName }
    
    func updateMail(_ mail: String) { user.mail = mail }
    
    func updateGender(_ gender: Gender) { user.gender = gender }
    
    func updateWeight(_ weight: Int) { user.weight = weight }
    
    func updateHeight(_ height: Int) { user.height = height }
    
    func updateGoal(_ goal: [Goal]?) { user.goal = goal }
    
    func updatePhoneNumber(_ phoneNumber: String) { user.phoneNumber = phoneNumber }
    
    func updatePhysicalActivity(_ level: ActivityLevel) { user.physicalActivityLevel = level }
    
    func updatePicture(_ picture: Data) { self.user.profilePicture = picture }

    func save(_ userData: User) { self.user = userData }
}
