//
//  GoalTableViewCell.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/3/23.
//

import UIKit

final class GoalTableViewCell: UITableViewCell {

    static let identifier = "GoalTableViewCell"
    
    // MARK:- Private Outlets
    private lazy var goalLb: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = Const.Colors.tintColorWhite
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.text = "LABEL TEXT"
        return lb
    }()
    
    private lazy var chekMarkImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 2
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var customBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.1211029962, green: 0.13273561, blue: 0.1659480631, alpha: 1)
        view.addSubview(goalLb)
        view.addSubview(chekMarkImageView)
        self.addSubview(view)
        return view
    }()
    
    // MARK:- Init Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCellStyle()
        constraints()
    }

    func updateCell(with goal: String, isChecked: Bool) {
        self.goalLb.text = goal
        
        // Create Configuration for image
        let configura = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        
        if isChecked {
            
            //  Set Check image with configuration
            chekMarkImageView.image = Const.Icon.checkMarkIcon.withConfiguration(configura).withTintColor(Const.Colors.highlightBackgroundColor, renderingMode: .alwaysOriginal)
            
            //  Set Border Color
            self.customBackgroundView.layer.borderColor = Const.Colors.highlightBackgroundColor.cgColor
            
        } else {
            setDefaultDesign(with: configura)
        }
    }
    
    private func setDefaultDesign(with configura: UIImage.SymbolConfiguration) {
        
       
        // Set UnCheck image with configuration
        chekMarkImageView.image = Const.Icon.squareIcon
            .withConfiguration(configura)
            .withTintColor(Const.Colors.highlightBackgroundColor, renderingMode: .alwaysOriginal)
        
        //  Clear Border color
        customBackgroundView.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setCellStyle() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func constraints() {
        customBackgroundView.anchor(top: self.topAnchor, paddingTop: 10,
                                    bottom: self.bottomAnchor, paddingBottom: 10,
                                    left: self.leftAnchor, paddingLeft: 10,
                                    right: self.rightAnchor, paddingRight: 10,
                                    width: 0,
                                    height: 0,
                                    centerX: nil,
                                    centerY: nil
        )
        
        chekMarkImageView.anchor(top: nil, paddingTop: 0,
                                 bottom: nil, paddingBottom: 0,
                                 left: nil, paddingLeft: 0,
                                 right: customBackgroundView.rightAnchor, paddingRight: 20,
                                 width: 10,
                                 height: 10,
                                 centerX: nil,
                                 centerY: self.customBackgroundView.centerYAnchor
        )
        
        let goalLbConstraints = [goalLb.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: 20),
                                 goalLb.centerYAnchor.constraint(equalTo: customBackgroundView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(goalLbConstraints)
    }
}
