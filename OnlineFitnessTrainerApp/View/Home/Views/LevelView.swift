//
//  LevelView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 10/23/23.
//

import UIKit

protocol LevelViewDelegate: AnyObject {
    func levelButtonWasTapped(_ button: UIButton)
}

final class LevelView: UIView {
    
    // MARK:- Properties
    weak var delegate: LevelViewDelegate!
    private var tappedButton: UIButton?
    
    // MARK:- Outlets
    private lazy var begginerLevelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Beginner", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = Const.Colors.tintColorHighlight.cgColor
        btn.titleLabel?.font = UIFont(name: Const.FontFemily.helvetica, size: 12)
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(levelButtonTapped), for: .allTouchEvents)
        return btn
    }()
    
    private lazy var intermediateLevelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Intermediate", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = Const.Colors.tintColorHighlight.cgColor
        btn.titleLabel?.font = UIFont(name: Const.FontFemily.helvetica, size: 12)
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(levelButtonTapped), for: .allTouchEvents)
        return btn
    }()
    
    private lazy var advancedLevelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Expert", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = Const.Colors.tintColorHighlight.cgColor
        btn.titleLabel?.font = UIFont(name: Const.FontFemily.helvetica, size: 12)
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(levelButtonTapped), for: .allTouchEvents)
        return btn
    }()
    
    private lazy var levelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.addArrangedSubview(begginerLevelBtn)
        stackView.addArrangedSubview(intermediateLevelBtn)
        stackView.addArrangedSubview(advancedLevelBtn)
        addSubview(stackView)
        return stackView
    }()
    
    convenience init(delegate: LevelViewDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustaConstraints()
    }
}

extension LevelView {
    
    // MARK:- Private methods
    private func adjustaConstraints() {
        levelStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        levelStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        levelStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        levelStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK:- Level Button Method
    @objc private func levelButtonTapped(_ sender: UIButton) {
        if tappedButton != sender {
            tappedButton?.backgroundColor = .clear
            sender.backgroundColor = Const.Colors.highlightBackgroundColor
            tappedButton = sender
            delegate.levelButtonWasTapped(tappedButton!)
        }
    }
}

