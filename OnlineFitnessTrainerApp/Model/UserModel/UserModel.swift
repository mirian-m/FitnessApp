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
}
extension User {
    func transformTo() -> [String: Any] {
        var tempDict = [String: Any]()
        tempDict[Const.FStore.Fields.name] = self.name ?? ""
        tempDict[Const.FStore.Fields.lastName] = self.lastName ?? ""
        tempDict[Const.FStore.Fields.mail] = self.mail ?? ""
        tempDict[Const.FStore.Fields.age] = self.age ?? 0
        tempDict[Const.FStore.Fields.weight] = self.weight ?? 0
        tempDict[Const.FStore.Fields.height] = self.height ?? 0
        tempDict[Const.FStore.Fields.gender] = self.gender?.rawValue ?? ""
        tempDict[Const.FStore.Fields.profilePicture] = self.profilePicture ?? ""
        tempDict[Const.FStore.Fields.phoneNumber] = self.phoneNumber ?? ""
        tempDict[Const.FStore.Fields.physicalActivityLevel] = self.physicalActivityLevel?.rawValue ?? ""
        tempDict[Const.FStore.Fields.goal] = self.goal?.map({ $0.rawValue })

        return tempDict
    }
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
