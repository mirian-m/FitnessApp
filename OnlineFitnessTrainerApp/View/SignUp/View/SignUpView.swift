//
//  SingUpView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/18/23.
//

import UIKit

final class SignUpView: LogInView {
    private weak var delegate: Listener?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(delegate: Listener) {
        self.init(viewTitle: "Create your \nAccount",
                   signInBtnTitle: "Sing up",
                   bottomLabelTitle: "Alread have an account",
                   signUpBtnTitle: "Sign in", delegate: delegate)
        
        hideForgotPasswordBtn()
    }
}
