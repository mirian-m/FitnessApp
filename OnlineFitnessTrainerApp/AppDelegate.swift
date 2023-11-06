//
//  AppDelegate.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/26/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configuration()
        return true
    }

    private func configuration() {
        FirebaseApp.configure()
        
        //  Make tabbar translucent
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        
        //  NAviagtion bar configuration
        UINavigationBar.appearance().isHidden = true
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().isTranslucent = true
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}


}

