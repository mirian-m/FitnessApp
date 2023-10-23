//
//  CustomHeaderView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/22/23.
//

import UIKit

final class CustomHeaderView: UIView {
    
    // MARK:- Outlets
    private lazy var titleLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont(name: "HelveticaNeue", size: 12)
        addSubview(lb)
        return lb
    }()
    
    private lazy var seeAllButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("See All", for: .normal)
        btn.setTitleColor(Const.Colors.tintColorHighlight, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        addSubview(btn)
        return btn
    }()
    
    // MARK:- Life cycle methods
    convenience init(title: String) {
        self.init()
        titleLb.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
    }
}

extension CustomHeaderView {
    
    private func adjustConstraints() {
        let titleLbConstraints = [
            titleLb.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLb.topAnchor.constraint(equalTo: topAnchor),
            titleLb.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let seeAllButtonConstraints = [
            seeAllButton.centerYAnchor.constraint(equalTo: titleLb.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLbConstraints)
        NSLayoutConstraint.activate(seeAllButtonConstraints)
    }
}
