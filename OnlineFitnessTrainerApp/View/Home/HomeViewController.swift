//
//  HomeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import UIKit

class HomeViewController: UIViewController {
    private var manager = HomeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        manager.fetchData()
    }
    func bind() {
        manager.workOuts.bind { workOutPlan in
            print(workOutPlan?.first?.difficulty! ?? "")
        }
    }
}
