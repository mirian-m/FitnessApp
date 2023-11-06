//
//  FeatureWorkoutCollectionViewCell.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/21/23.
//

import UIKit

final class WorkoutCollectionViewCell: UICollectionViewCell {
    static var identifier: String { .init(describing: self) }
    private let workOutViewForCell = WorkOutView()
    
    
    // MARK:- life Cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(workOutViewForCell)
        workOutViewForCell.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WorkoutCollectionViewCell {
    func cellConfiguration(_ model: WorkoutModel) {
        workOutViewForCell.setViewOutlets(model)
    }
}
