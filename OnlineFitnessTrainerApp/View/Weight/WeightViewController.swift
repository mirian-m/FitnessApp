//
//  WeightViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/1/23.
//

import UIKit

final class WeightViewController: UserInfoViewController {
    
    // MARK:- Override property
    override var dataManager: DataCreateManager {
        DataCreateManager(firstNumber: 40, lastNumber: 200)
    }
    
    // MARK:- controller lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(title: "What Is Your Weight?",
                   subTitle: "Weight in kg. Don't worry you can always change it later.",
                   rotationAngel: 90 * (.pi / 180)
        )
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    // MARK:- override methods
    override func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Back":
            self.navigationController?.popViewController(animated: true)
        default:
            let weight = Int(dataManager.getDataAt(index: self.selectedItemIndex)) ?? 0
            UserDataService.shared.updateWeight(weight)
            self.navigationController?.pushViewController(HeightViewController(), animated: true)
        }
    }
}




