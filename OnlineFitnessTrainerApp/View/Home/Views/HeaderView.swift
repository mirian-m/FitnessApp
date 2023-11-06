//
//  CustomHeaderView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/22/23.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func seeAllButtonsWasTapped()
}

final class HeaderView: UIView {
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK:- Outlets
    private lazy var titleLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont(name: Const.FontFemily.Helvetica.normal, size: 12)
        addSubview(lb)
        return lb
    }()
    
    private lazy var seeAllButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("See All", for: .normal)
        btn.setTitleColor(Const.Colors.tintColorHighlight, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        btn.addTarget(self, action: #selector(allButtonsTapped), for: .allTouchEvents)
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
    
    @objc private func allButtonsTapped() {
        delegate?.seeAllButtonsWasTapped()
    }
}

extension HeaderView {
    
    private func adjustConstraints() {
        let titleLbConstraints = [
            titleLb.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLb.topAnchor.constraint(equalTo: topAnchor),
            titleLb.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        let seeAllButtonConstraints = [
            seeAllButton.centerYAnchor.constraint(equalTo: titleLb.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLbConstraints)
        NSLayoutConstraint.activate(seeAllButtonConstraints)
    }
}
