//
//  GoalDataManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/3/23.
//

import UIKit

final class GoalDataManager {
    private lazy var goals = Goal.allCases.map { $0.rawValue }
    
    //  Observable Object property
    public var goalsSelection: ObservableObject<[Bool]> = ObservableObject(Array(repeating: false, count: 6))
    
    public var goalNumber: Int {
        goals.count
    }
    
    func getDataAt(index: Int) -> String { goals[index] }
    
    func updateGoalSelection(at index: Int) {
        goalsSelection.value?[index].toggle()
    }
    
    func getSelectedGoals() -> [Goal]? {
        var selectedGoals: [Goal]? = []
        for index in 0..<goalNumber{
            if goalsSelection.value![index] {
                guard let goal = Goal(rawValue: goals[index]) else { return nil }
                selectedGoals?.append(goal)
            }
        }
        return selectedGoals
    }
}
