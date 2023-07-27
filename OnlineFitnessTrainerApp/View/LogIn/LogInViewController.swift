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
                self?.navigationController?.pushViewController(UIViewController(), animated: true)
            } else if error != "" {
                self?.loginView.animateTextFields()
                self?.loginView.updateErrorLb(error!)
            }
        }
    }
    
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.accessibilityIdentifier {
        case GetInWith.apple:
            manager.logInWithApple()
        case GetInWith.faceBook:
            manager.logInWithFacebook()
        case GetInWith.google:
            manager.logInWithGoogle()
        case GetInWith.emailPassword:
            manager.logInWith(email: loginView.getEmali() ?? "", password: loginView.getPassword() ?? "")
        default:
            navigationController?.pushViewController(SignUpViewController(), animated: true)
        }
    }
    
}
