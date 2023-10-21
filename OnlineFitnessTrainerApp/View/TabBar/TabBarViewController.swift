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
        let image = Const.Icon.goFitIcon
        let customBtn = UIButton()
        customBtn.buttonSet(image, "GoFit")
        let btn = UIBarButtonItem(customView: customBtn)
        navigationItem.setLeftBarButton(btn, animated: true)
        navigationItem.setRightBarButtonItems([
            UIBarButtonItem(image: Const.Icon.bookmarkIcon
                                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 13))
                                .withTintColor(.white, renderingMode: .alwaysOriginal),
                            style: .done, target: self, action: nil),
            
            UIBarButtonItem(image: Const.Icon.bellIcon
                                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 13))
                                .withTintColor(.white, renderingMode: .alwaysOriginal),
                            style: .done, target: self, action: nil)
        ], animated: true)
        
        title = "Good Morning 👋"
        
    }
    
    private func addViewControllersToTabbar() {
        let vc = HomeViewController()
        vc.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.homeIcon.withTintColor(.gray, renderingMode: .alwaysOriginal),
            selectedImage: Const.Icon.homeFillIcon.withRenderingMode(.alwaysOriginal).withTintColor(.white, renderingMode: .alwaysOriginal)
        )
        
//        let vc1 = GoalViewController()
//        vc1.tabBarItem = UITabBarItem(
//            title: "",
//            image: UIImage(systemName: "square.and.arrow.up")?.withTintColor(.black, renderingMode: .alwaysOriginal),
//            selectedImage: UIImage(systemName: "square.and.arrow.up.fill")
//        )
        self.setViewControllers([vc], animated: true)
    }
    
}
