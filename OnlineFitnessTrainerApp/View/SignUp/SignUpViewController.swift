//
//  SignUpViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/18/23.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private var manager = SignUpViewModel()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        manager.saveUserData()
    }

    private func bind() {
        manager.error.bind { [weak self] error in
            if error == nil {
                self?.navigationController?.pushViewController(TabBarViewController(), animated: true)
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
        case Const.GetIn.apple:
            manager.logInWithApple()
        case Const.GetIn.faceBook:
            manager.logInWithFacebook()
        case Const.GetIn.google:
            manager.logInWithGoogle()
        case Const.GetIn.emailPassword:
            manager.signUpWith(email: signUpView.getEmali() ?? "", password: signUpView.getPassword() ?? "")
        default:
            navigationController?.pushViewController(LogInViewController(), animated: true)
        }
    }
}
