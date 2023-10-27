//
//  User.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import Foundation

struct User {
    var name: String?
    var lastName: String?
    var mail: String?
    var gender: Gender?
    var age: Int?
    var weight: Int?
    var height: Int?
    var goal: [Goal]?
    var profilePicture: Data?
    var physicalActivityLevel: ActivityLevel?
    var phoneNumber: String?
    var favouriteWorkoutsID: [String]?
}

enum Goal: String, CaseIterable {
    case getFitter = "Get Fitter"
    case gainWeight = "Gain Weight"
    case loseWeight = "Lose Weight"
    case buildingMuscules = "Building Muscules"
    case improvingEndurance = "Improving Endurance"
    case others = "Others"
}

enum ActivityLevel: String, CaseIterable {
    case beginner = "Beginner"
    case intermadiate = "Intermadiate"
    case advanced = "Advanced"
}

enum Gender: Int {
    case male = 0
    case female
}
