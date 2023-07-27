//
//  WeightViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/1/23.
//


import UIKit

final class HeightViewController: UserInfoViewController {
    
    // MARK:- Override property
    override var dataManager: DataCreateManager {
        DataCreateManager(firstNumber: 160, lastNumber: 200)
    }
    
    // MARK:- ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Init Method
    init() {
        super.init(title: "What Is Your Height?",
                   subTitle: "Height in cm. Don't worry you can always change it later."
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
            let height = Int(dataManager.getDataAt(index: self.selectedItemIndex)) ?? 0
            UserDataService.shared.updateHeight(height)
            self.navigationController?.pushViewController(GoalViewController(), animated: true)
        }
    }
}
