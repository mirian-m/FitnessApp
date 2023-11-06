//
//  DiscoverTableViewCell.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 11/6/23.
//

import UIKit

final class DiscoverTableViewCell: UITableViewCell {
    static var identifier: String { .init(describing: self) }
    private let workoutViewForCell = WorkOutView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(workoutViewForCell)
        workoutViewForCell.frame = self.bounds
        backgroundColor = .clear
    }
}
