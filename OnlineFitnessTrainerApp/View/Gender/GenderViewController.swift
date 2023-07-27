//
//  GenderViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import UIKit

final class GenderViewController: UIViewController {
    private var gender: Gender?
    
    // MARK:- ViewController lifecycle
    override func loadView() {
        super.loadView()
        self.view = GenderView(text: "To give you a better experience and result we need to kwon your gender", delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GenderViewController: Listener {
    // MARK:- Protocol Method
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.tag {
        case 0, 1:
            gender = Gender(rawValue: sender!.tag)
            sender?.backgroundColor = Const.Colors.highlightBackgroundColor
        default:
            if let gender = gender {
                UserDataService.shared.updateGender(gender)
            }
            self.navigationController?.pushViewController(AgeViewController(), animated: true)
        }
    }
}
