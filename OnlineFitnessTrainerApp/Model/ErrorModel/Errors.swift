//
//  UserDataSaveErrors.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/13/23.
//

import Foundation

enum Errors: String, Error {
    case success
    case fields = "Pleas Fill All fields"
    case email = "Email Address Is Not Correct"
    case phoneNumber = "Pleas Enter Correct Phone Number"
    case password = "Please enter correct password"
}
