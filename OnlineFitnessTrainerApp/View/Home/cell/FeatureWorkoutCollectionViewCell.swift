//
//  FeatureWorkoutCollectionViewCell.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/21/23.
//

import UIKit

final class FeatureWorkoutCollectionViewCell: UICollectionViewCell {
    static var identifier: String { .init(describing: self) }
    
    private lazy var workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        addSubview(imageView)
        return imageView
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        workoutImageView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func adjustConstraints() {
        let workoutImageViewConstraints = [
            workoutImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            workoutImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            workoutImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(workoutImageViewConstraints)
    }
    
}
