//
//  HomeManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/27/23.
//

import Foundation

struct HomeManager {
    var workOuts: ObservableObject<[WorkoutModel]> = ObservableObject([])
    
    private var urlRequest: URLRequest? {
        guard let muscle = "cardio".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(Const.APIData.baseUrl)type=" + muscle)
        else { return nil }
        var request = URLRequest(url: url)
        request.setValue(Const.APIData.APIKey, forHTTPHeaderField: "X-Api-Key")
        return request
    }
    
    func fetchData() {
        APIService.shared.fetchData(with: self.urlRequest) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let workoutPlan):
                    workOuts.value = workoutPlan
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func getWorkoutBy(_ level: String) -> WorkoutModel? {
        let  k = workOuts.value?.filter({ $0.difficulty?.lowercased() == level.lowercased() }).first
        return k
    }
}
