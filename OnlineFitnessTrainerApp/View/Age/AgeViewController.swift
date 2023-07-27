//
//  AgeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/2/23.
//

import UIKit

final class AgeViewController: UserInfoViewController {
    override var dataManager: DataCreateManager {
        get {
            DataCreateManager(firstNumber: 15, lastNumber: 60)
        }
    }
    // MARK:- ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Init Method
    init() {
        super.init(title: "How Old Are You?",
                   subTitle: "Age in years. This will hepl us to personalize an excercise program plan that suits to you"
        )
    }
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    // MARK:- Override Methods
    override func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Back":
            self.navigationController?.popViewController(animated: true)
        default:
            let age = Int(dataManager.getDataAt(index: self.selectedItemIndex)) ?? 0
            UserDataService.shared.updateAge(age)
            self.navigationController?.pushViewController(WeightViewController(), animated: true)
        }
    }
}
