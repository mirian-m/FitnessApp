//
//  GetInViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/13/23.
//

import UIKit

final class GetInViewController: UIViewController {
    
    // MARK:- ViewController lifeCycle
    override func loadView() {
        super.loadView()
        view = GetInView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GetInViewController: Listener {
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.accessibilityIdentifier {
        case Const.GetIn.faceBook:
            print("Facebook")
        case Const.GetIn.google:
            print("Google")
        case Const.GetIn.apple:
            print("Apple")
        case Const.GetIn.emailPassword:
            navigationController?.pushViewController(LogInViewController(), animated: true)
        default:
            navigationController?.pushViewController(GenderViewController(), animated: true)
        }
    }
}
