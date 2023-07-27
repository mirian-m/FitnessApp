//
//  SignUpViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/18/23.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private var manager = SignUpViewModelManager()
    private lazy var signUpView = SignUpView(delegate: self)
    
    // MARK:-ViewConstorller lifecycle
    override func loadView() {
        super.loadView()
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        manager.error.bind { [weak self] error in
            if error == nil {
            self?.manager.saveUserDataOnFireBase()
            self?.navigationController?.pushViewController(UIViewController(), animated: true)
            } else if error != "" {
                self?.signUpView.animateTextFields()
                self?.signUpView.updateErrorLb(error!)
            }
        }
    }
}
extension SignUpViewController: Listener {
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.accessibilityIdentifier {
        case GetInWith.apple:
            manager.logInWithApple()
        case GetInWith.faceBook:
            manager.logInWithFacebook()
        case GetInWith.google:
            manager.logInWithGoogle()
        case GetInWith.emailPassword:
            manager.signUpWith(email: signUpView.getEmali() ?? "", password: signUpView.getPassword() ?? "")
        default:
            navigationController?.pushViewController(LogInViewController(), animated: true)
        }
    }
}
