//
//  GetInView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/13/23.
//

import UIKit

final class GetInView: UIView {
    
    private weak var delegate: Listener?
    
    // MARK:- Private Ountlets
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Const.Fonts.title
        label.textColor = Const.Colors.tintColorWhite
        label.text = "Let's you in"
        label.minimumScaleFactor = 0.9
        addSubview(label)
        return label
    }()
    
    private lazy var facebookBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.faceBook
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        btn.buttonSet(Const.Icon.facebookIcon, "Continue with Facebook")
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.tintColor = Const.Colors.tintColorWhite
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton

        return btn
    }()
    
    private lazy var googleBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.google
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        btn.buttonSet(Const.Icon.googleIcon, "Continue with Google")
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.tintColor = Const.Colors.tintColorWhite
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        return btn
    }()
    
    private lazy var appelBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.apple
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        btn.buttonSet(Const.Icon.appleIcon, "Continue with Apple")
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.tintColor = Const.Colors.tintColorWhite
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        return btn
    }()
    
    private lazy var accountBtnsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(facebookBtn)
        stackView.addArrangedSubview(googleBtn)
        stackView.addArrangedSubview(appelBtn)
        addSubview(stackView)
        return stackView
    }()
    
    
    private lazy var signInBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sing in with password", for: .normal)
        btn.backgroundColor = Const.Colors.highlightBackgroundColor
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.layer.cornerRadius = 20
        btn.accessibilityIdentifier = GetInWith.emailPassword
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
    
    private lazy var leftLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.0
        view.layer.borderColor = Const.Colors.backgroundColorLightDark.cgColor
        separatorView.addSubview(view)
        return view
    }()
    
    private lazy var rightLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.0
        view.layer.borderColor = Const.Colors.backgroundColorLightDark.cgColor
        separatorView.addSubview(view)
        return view
    }()
    
    private lazy var orLB: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "or"
        lb.font = Const.Fonts.subTitle
        lb.textColor = Const.Colors.tintColorWhite
        separatorView.addSubview(lb)
        return lb
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account?"
        label.font = Const.Fonts.subTitle
        label.textColor = Const.Colors.tintColorGray
        addSubview(label)
        return label
    }()
    
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign up", for: .normal)
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.setTitleColor(Const.Colors.tintColorHighlight, for: .normal)
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomLabel)
        view.addSubview(signUpBtn)
        addSubview(view)
        return view
    }()

    // MARK:- View Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(delegate: Listener) {
        self.init(frame: .zero)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Const.Colors.backgroundColorDark
        adjustConstreints()
    }
}

// MARK:- Extension set constraints
extension GetInView {
    
    private func adjustConstreints() {
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: accountBtnsStackView.topAnchor, constant: -90)
        ]
        
        let accaountBtnsStackViewConstraints = [
            accountBtnsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            accountBtnsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountBtnsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            accountBtnsStackView.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        
        let separatorViewConstraints = [
            separatorView.leadingAnchor.constraint(equalTo: accountBtnsStackView.leadingAnchor),
            separatorView.topAnchor.constraint(equalTo: accountBtnsStackView.bottomAnchor, constant: 40),
            separatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let leftLineViewConstraints = [
            leftLineView.leadingAnchor.constraint(equalTo: separatorView.leadingAnchor),
            leftLineView.centerYAnchor.constraint(equalTo: orLB.centerYAnchor),
            leftLineView.trailingAnchor.constraint(equalTo: orLB.leadingAnchor, constant: -10),
            leftLineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let orLBConstraints = [
            orLB.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor),
            orLB.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor)
        ]
        
        let rightLineViewConstraints = [
            rightLineView.leadingAnchor.constraint(equalTo: orLB.trailingAnchor, constant: 10),
            rightLineView.centerYAnchor.constraint(equalTo: orLB.centerYAnchor),
            rightLineView.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor),
            rightLineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        let bottomViewConstraints = [
            bottomView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bottomView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomView.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let bottomLabelConstraints = [
            bottomLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -20),
            bottomLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
        ]
        
        let signInBtnConstraints = [
            signInBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInBtn.leadingAnchor.constraint(equalTo: accountBtnsStackView.leadingAnchor),
            signInBtn.heightAnchor.constraint(equalTo: facebookBtn.heightAnchor),
            signInBtn.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 40)
        ]
        
        let signUpBtnConstraints = [
            signUpBtn.centerYAnchor.constraint(equalTo: bottomLabel.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: bottomLabel.trailingAnchor, constant: 5)
        ]
        
        //  Activate Constraints
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(accaountBtnsStackViewConstraints)
        NSLayoutConstraint.activate(separatorViewConstraints)
        NSLayoutConstraint.activate(leftLineViewConstraints)
        NSLayoutConstraint.activate(orLBConstraints)
        NSLayoutConstraint.activate(signInBtnConstraints)
        NSLayoutConstraint.activate(rightLineViewConstraints)
        NSLayoutConstraint.activate(bottomViewConstraints)
        NSLayoutConstraint.activate(bottomLabelConstraints)
        NSLayoutConstraint.activate(signUpBtnConstraints)
    }
    
}

// MARK:- Button Action methods
extension GetInView {
    @objc private func accountButtonPressd(_ sender: UIButton) {
        delegate?.buttonPressd(sender)
    }
}
