//
//  WorkOutModel.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import Foundation

// MARK: - Element
struct WorkOutModel: Codable {
    let name: String?
    let type: String?
    let muscle: String?
    let equipment: String?
    let difficulty: String?
    let instructions: String?
}

enum Difficulty: String, Codable {
    case beginner = "beginner"
    case intermediate = "intermediate"
}

enum Muscle: String, Codable {
    case biceps
}

enum WorkoutType: String, Codable {
    case strength
    case cardio
}
