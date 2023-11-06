//
//  TabBarViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 8/4/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK:- Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        congfiguration()
    }
}

extension TabBarViewController {
    
    private func congfiguration() {
        addViewControllersToTabbar()
    }
    
    private func addViewControllersToTabbar() {
        let home = HomeViewController()
        let discover = DiscoverViewController()
        
        home.tabBarItem = UITabBarItem(
            title: "Home",
            image: Const.Icon.homeIcon.withTintColor(.gray, renderingMode: .alwaysOriginal),
            selectedImage: Const.Icon.homeFillIcon
                .withTintColor(.white, renderingMode: .alwaysOriginal)
        )
        
        discover.tabBarItem = UITabBarItem(
            title: "Discover",
            image: UIImage(systemName: "paperplane.circle.fill"),
            selectedImage: UIImage(systemName: "paperplane.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        )
        
        let controllers = [home, discover].map({UINavigationController(rootViewController: $0)})
        self.setViewControllers(controllers, animated: true)
    }
}
