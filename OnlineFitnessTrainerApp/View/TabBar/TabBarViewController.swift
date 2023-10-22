//
//  TabBarViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 8/4/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK:- Life Cycle Method
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        congfiguration()
    }
}

extension TabBarViewController {
    
    private func congfiguration() {
        addViewControllersToTabbar()
    }
    private func addViewControllersToTabbar() {
        let vc = HomeViewController()
        vc.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.homeIcon.withTintColor(.gray, renderingMode: .alwaysOriginal),
            selectedImage: Const.Icon.homeFillIcon.withRenderingMode(.alwaysOriginal).withTintColor(.white, renderingMode: .alwaysOriginal)
        )
        self.setViewControllers([vc], animated: true)
    }
    
}
