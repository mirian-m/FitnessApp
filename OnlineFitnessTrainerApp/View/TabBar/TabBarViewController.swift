//
//  TabBarViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 8/4/23.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        congfiguration()
    }
    
}

extension TabBarViewController {
    
    private func congfiguration() {
        navigationBarConfigure()
        addViewControllersToTabbar()
    }
    
    private func navigationBarConfigure() {
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.barTintColor = .clear
        
        let image = Const.Icon.goFitLogo
        let customBtn = UIButton()
        customBtn.setImage(image, for: .normal)
        let btn = UIBarButtonItem(customView: customBtn)
        navigationItem.setLeftBarButton(btn, animated: true)
    }
    
    private func addViewControllersToTabbar() {
        let vc = HomeViewController()
        vc.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.homeIcon.withTintColor(.gray, renderingMode: .alwaysOriginal),
            selectedImage: Const.Icon.homeFillIcon.withRenderingMode(.alwaysOriginal).withTintColor(.white, renderingMode: .alwaysOriginal)
        )
        
        let vc1 = GoalViewController()
        vc1.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "square.and.arrow.up")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            selectedImage: UIImage(systemName: "square.and.arrow.up.fill")
        )
        
        self.setViewControllers([vc, vc1], animated: true)
    }
    
}
