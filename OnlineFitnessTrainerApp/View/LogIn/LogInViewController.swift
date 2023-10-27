//
//  LogInViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/16/23.
//

import UIKit

final class LogInViewController: UIViewController, Listener {
    
    private lazy var loginView = LogInView(
        viewTitle: "Login to your \nAccount",
        signInBtnTitle: "Sing In",
        bottomLabelTitle: "Don't have an account?",
        signUpBtnTitle: "Sign up",
        delegate: self
    )
    
    private var manager = LogInViewModelManager()
    
    //  MARK:- ViewConstroller lifecycle
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        manager.error.bind { [weak self] error in
            if error == nil {
                self?.navigationController?.pushViewController(TabBarViewController(), animated: true)
            } else if error != "" {
                self?.loginView.animateTextFields()
                self?.loginView.updateErrorLb(error!)
            }
        }
    }
    
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.accessibilityIdentifier {
        case Const.GetIn.apple:
            manager.logInWithApple()
        case Const.GetIn.faceBook:
            manager.logInWithFacebook()
        case Const.GetIn.google:
            manager.logInWithGoogle()
        case Const.GetIn.emailPassword:
            manager.logInWith(email: loginView.getEmali() ?? "", password: loginView.getPassword() ?? "")
        default:
            navigationController?.pushViewController(GenderViewController(), animated: true)
        }
    }
    
}
