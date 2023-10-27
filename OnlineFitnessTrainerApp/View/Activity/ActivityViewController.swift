//
//  AcivityViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/4/23.
//

import UIKit

final class ActivityViewController: UIViewController, Listener {
    
    private var pressedButton: UIButton?
    
    // MARK:- Private Outlets
    
    private lazy var beginnerBtn: UIButton = {
        let btn = creatButton(title: "Beginner")
        return btn
    }()
    
    private lazy var intermediateBtn: UIButton = {
        let btn = creatButton(title: "Intermediate")
        return btn
    }()
    
    private lazy var advancedBtn: UIButton = {
        let btn = creatButton(title: "Advanced")
        return btn
    }()
    
    private lazy var viewForButtons: UIView = {
        let view = UIView()
        view.addSubview(beginnerBtn)
        view.addSubview(intermediateBtn)
        view.addSubview(advancedBtn)
        return view
    }()
    
    
    // MARK:- viewcontroller life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustConstaints()
    }
    
    // MARK:- Protocolo Method
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Back":
            self.navigationController?.popViewController(animated: true)
        default:
            if let title = pressedButton?.currentTitle, let level = ActivityLevel(rawValue: title)  {
                UserDataService.shared.updatePhysicalActivity(level)
            }
            self.navigationController?.pushViewController(ProfileFieldsViewController(), animated: true)
        }
    }
}

// MARK:- Viewcontroller extesion
extension ActivityViewController {
    
    //  Set custom View
    private func setCustomView() {
        self.view = CustomView(title: "Physicaly Activity Level?",
                               subTitle: "Choose your regular activity level. THis will help us to personalize plans for you.",
                               delegate: self)
        
        guard let backgroundView = (self.view as? CustomView) else { return }
        backgroundView.centerStackView.addArrangedSubview(viewForButtons)
        
    }
    
    //  Adjust contraints method
    private func adjustConstaints() {
        
        beginnerBtn.anchor(top: nil, paddingTop: 15,
                           bottom: nil, paddingBottom: 0,
                           left: viewForButtons.leftAnchor, paddingLeft: 10,
                           right: nil, paddingRight: 0,
                           width: 0,
                           height: 60,
                           centerX: viewForButtons.centerXAnchor,
                           centerY: viewForButtons.centerYAnchor
        )
        intermediateBtn.anchor(top: beginnerBtn.bottomAnchor, paddingTop: 15,
                               bottom: nil, paddingBottom: 0,
                               left: beginnerBtn.leftAnchor, paddingLeft: 0,
                               right: nil, paddingRight: 0,
                               width: 0,
                               height: 60,
                               centerX: viewForButtons.centerXAnchor,
                               centerY: nil
        )
        advancedBtn.anchor(top: intermediateBtn.bottomAnchor, paddingTop: 15,
                           bottom: nil, paddingBottom: 0,
                           left: beginnerBtn.leftAnchor, paddingLeft: 0,
                           right: nil, paddingRight: 0,
                           width: 0,
                           height: 60,
                           centerX: viewForButtons.centerXAnchor,
                           centerY: nil
        )
    }
    
    //  Create Button method
    private func creatButton(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.tintColor = Const.Colors.tintColorWhite
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.layer.borderColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(activityButtonPressed), for: .touchUpInside)
        return btn
    }
    
    // MARK:- Activity Button Action
    @objc private func activityButtonPressed(_ sender: UIButton) {
        if pressedButton == nil {
            pressedButton = sender
        } else if pressedButton != sender {
            pressedButton?.backgroundColor = Const.Colors.backgroundColorLightDark
            pressedButton = sender
        }
        sender.backgroundColor = Const.Colors.highlightBackgroundColor
    }
}
