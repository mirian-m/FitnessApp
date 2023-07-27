//
//  ViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/26/23.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK:- ViewController LifeCycle
    
    override func loadView() {
        super.loadView()
        self.view = WelcomView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.navigationController?.pushViewController(HomeViewController(), animated: false)
        }
    }
}

