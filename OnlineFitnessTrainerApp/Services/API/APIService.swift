//
//  APIService.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchData(with urlRequest: URLRequest?, completion: @escaping (Result<[WorkoutModel], Error>) -> Void) {
        
        guard let urlRequest = urlRequest else { return }
        
        //  Create UrlSession dataTask
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let workoutData = data, error == nil else { return }
            do {
                let workoutPlan = try JSONDecoder().decode([WorkoutModel].self, from: workoutData)
                completion(.success(workoutPlan))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
