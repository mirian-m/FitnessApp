//
//  CellView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/24/23.
//

import UIKit

class WorkOutView: UIView {
    
    // MARK:- Outlets
    private lazy var workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Page3")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var workOutTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        lb.textColor = Const.Colors.tintColorWhite
        lb.text = "Full Body Stretching"
        addSubview(lb)
        return lb
        
    }()
    
    private lazy var timeLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "HelveticaNeue", size: 12)
        lb.textColor = Const.Colors.tintColorWhite
        lb.text = "10 Minuts"
        addSubview(lb)
        return lb
    }()
    
    private lazy var separatorLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "HelveticaNeue", size: 12)
        lb.textColor = Const.Colors.tintColorWhite
        lb.text = "|"
        addSubview(lb)
        return lb
    }()
    
    private lazy var workOutLevelLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "HelveticaNeue", size: 12)
        lb.textColor = Const.Colors.tintColorWhite
        lb.text = "Intermediate"
        addSubview(lb)
        return lb
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(
            Const.Icon.bookmarkIcon
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 15))
                .withTintColor(.white, renderingMode: .alwaysOriginal),
            for: .normal
        )
        btn.addTarget(self, action: #selector(bookmarkButtonTapped), for: .allTouchEvents)
        addSubview(btn)
        return btn
    }()
    
    // MARK:- life Cycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        workoutImageView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
    }
    
    @objc private func bookmarkButtonTapped() {
        
        bookmarkButton.setImage(Const.Icon.bookmarkFillIcon.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
}

// MARK:- Extension For constraints
extension WorkOutView {
    
    private func adjustConstraints() {
        let workoutImageViewConstraints = [
            workoutImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            workoutImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            workoutImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutImageView.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ]
        
        let workOutTitleLabelConstraints = [
            workOutTitleLabel.leadingAnchor.constraint(equalTo: workoutImageView.leadingAnchor, constant: 20),
            workOutTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let timeLabelConstraints = [
            timeLabel.leadingAnchor.constraint(equalTo: workOutTitleLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: workOutTitleLabel.bottomAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -15),
            timeLabel.bottomAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: -20)
        ]
        
        let separatorLabelConstraints = [
            separatorLabel.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor)
        ]
        
        let workOutLevelLabelConstraints = [
            workOutLevelLabel.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 10),
            workOutLevelLabel.centerYAnchor.constraint(equalTo: separatorLabel.centerYAnchor)
        ]
        let bookmarkButtonConstraints = [
            bookmarkButton.trailingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: -20),
            bookmarkButton.centerYAnchor.constraint(equalTo: workOutLevelLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(workoutImageViewConstraints)
        NSLayoutConstraint.activate(workOutTitleLabelConstraints)
        NSLayoutConstraint.activate(timeLabelConstraints)
        NSLayoutConstraint.activate(separatorLabelConstraints)
        NSLayoutConstraint.activate(workOutLevelLabelConstraints)
        NSLayoutConstraint.activate(bookmarkButtonConstraints)
    }
}

extension WorkOutView {
    func setViewOutlets(_ model: WorkoutModel) {
        workOutLevelLabel.text = model.difficulty
    }
}


