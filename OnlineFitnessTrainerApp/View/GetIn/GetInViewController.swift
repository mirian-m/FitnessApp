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
        case GetInWith.faceBook:
            print("Facebook")
        case GetInWith.google:
            print("Google")
        case GetInWith.apple:
            print("Apple")
        case GetInWith.emailPassword:
            navigationController?.pushViewController(LogInViewController(), animated: true)
        default:
            navigationController?.pushViewController(GenderViewController(), animated: true)
        }
    }
}
