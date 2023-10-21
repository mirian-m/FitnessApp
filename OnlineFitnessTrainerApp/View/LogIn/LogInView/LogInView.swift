//
//  LogInView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/16/23.
//

import UIKit

class LogInView: UIView {
    
    private weak var delegate: Listener?
    private var viewTitle: String!
    private var signInBtnTitle: String!
    private var bottomLabelTitle: String!
    private var signUpBtnTitle: String!
    // MARK:- Private Ountlets
    
    // MARK@objc :- TopView
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        addSubview(view)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Const.Fonts.title
        label.textColor = Const.Colors.tintColorWhite
        label.text = viewTitle
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // MARK:- Center View Components
    private lazy var email: UITextField = {
        return creatCustomTextField("Email", image: Const.Icon.emailIcon)
    }()
    
    private lazy var password: UITextField = {
        let textField = creatCustomTextField("Password", image: Const.Icon.lockIcon)
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        return textField
    }()
    
    private lazy var accountTextFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        return stackView
    }()
    
    private lazy var errorLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.isHidden = true
        lb.textColor = .red
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.numberOfLines = 0
        centerView.addSubview(lb)
        return lb
    }()

    private lazy var rememberBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.buttonSet(Const.Icon.squareIcon.withTintColor(Const.Colors.tintColorHighlight, renderingMode: .alwaysOriginal), "Remember me")
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.addTarget(self, action: #selector(rememberBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var signInBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(signInBtnTitle, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.4197117984, green: 0.355825007, blue: 0.6711767316, alpha: 1)
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.layer.cornerRadius = 25
        btn.accessibilityIdentifier = GetInWith.emailPassword
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var forgotPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot password?", for: .normal)
        btn.setTitleColor(Const.Colors.tintColorHighlight, for: .normal)
        btn.titleLabel?.font = Const.Fonts.subTitle
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(rememberBtn)
        stack.addArrangedSubview(signInBtn)
        stack.addArrangedSubview(forgotPasswordBtn)
        return stack
    }()
    
    // MARK:- Center View
    private lazy var centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accountTextFieldsStackView)
        view.addSubview(stackView)
        addSubview(view)
        return view
    }()
    
    // MARK:- Bottom View
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorView)
        view.addSubview(buttonHorizontalStackView)
        view.addSubview(bottomLabel)
        view.addSubview(signUpBtn)
        addSubview(view)
        return view
    }()
    
    // MARK:- Bottom View Components
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
        lb.text = "or continue with"
        lb.font = Const.Fonts.subTitle
        lb.textColor = Const.Colors.tintColorWhite
        separatorView.addSubview(lb)
        return lb
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var facebookBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.faceBook
        btn.setImage(Const.Icon.facebookIcon, for: .normal)
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.contentMode = .center
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var googleBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.google
        btn.setImage(Const.Icon.googleIcon, for: .normal)
        btn.contentMode = .center
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var appelBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityIdentifier = GetInWith.apple
        btn.setImage(Const.Icon.appleIcon, for: .normal)
        btn.contentMode = .center
        btn.backgroundColor = Const.Colors.backgroundColorLightDark
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    private lazy var buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.addArrangedSubview(facebookBtn)
        stackView.addArrangedSubview(googleBtn)
        stackView.addArrangedSubview(appelBtn)
        return stackView
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = bottomLabelTitle
        label.font = Const.Fonts.subTitle
        label.textColor = Const.Colors.tintColorGray
        return label
    }()
    
    private lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(signUpBtnTitle, for: .normal)
        btn.titleLabel?.font = Const.Fonts.subTitle
        btn.setTitleColor(Const.Colors.tintColorHighlight, for: .normal)
        btn.addTarget(self, action: #selector(accountButtonPressd), for: .touchUpInside)
        return btn
    }()
    
    // MARK:- View Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(viewTitle: String,
                     signInBtnTitle: String,
                     bottomLabelTitle: String,
                     signUpBtnTitle: String,
                     delegate: Listener?
    ) {
        self.init(frame: .zero)
        self.delegate = delegate
        self.viewTitle = viewTitle
        self.signInBtnTitle = signInBtnTitle
        self.bottomLabelTitle = bottomLabelTitle
        self.signUpBtnTitle = signUpBtnTitle
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
extension LogInView {
    
    private func adjustConstreints() {
        
        // MARK:- Top components constraints
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -40),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
        ]
        
        let topViewConstraints = [
            topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ]
        
        // MARK:- Center components constaints
        email.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let accaountTextFieldsStackViewConstraints = [
            accountTextFieldsStackView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor),
            accountTextFieldsStackView.topAnchor.constraint(equalTo: centerView.topAnchor),
            accountTextFieldsStackView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
        ]
        
        let stackViewConstraints = [
            stackView.leadingAnchor.constraint(equalTo: accountTextFieldsStackView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: accountTextFieldsStackView.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let errorLbConstraints = [
            errorLb.topAnchor.constraint(equalTo: accountTextFieldsStackView.bottomAnchor, constant: 5),
            errorLb.leadingAnchor.constraint(equalTo: accountTextFieldsStackView.leadingAnchor, constant: 10),
            errorLb.trailingAnchor.constraint(equalTo: accountTextFieldsStackView.trailingAnchor)
        ]
        
        signInBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let centerViewConstraints = [
            centerView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            centerView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            centerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
        ]
        
        // MARK:- Bottom Components constraints
        
        let bottomViewConstraints = [
            bottomView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            bottomView.topAnchor.constraint(equalTo: centerView.bottomAnchor),
            bottomView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ]
        
        let separatorViewConstraints = [
            separatorView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            separatorView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 60),
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
        
        let buttonHorizontalStackViewConstraints = [
            buttonHorizontalStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 40),
            buttonHorizontalStackView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            buttonHorizontalStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            buttonHorizontalStackView.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        let bottomLabelConstraints = [
            bottomLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -20),
            bottomLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10)
        ]
        let signUpBtnConstraints = [
            signUpBtn.centerYAnchor.constraint(equalTo: bottomLabel.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: bottomLabel.trailingAnchor, constant: 5)
        ]
        
        
        //  Activate Constraints
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(topViewConstraints)
        NSLayoutConstraint.activate(errorLbConstraints)
        NSLayoutConstraint.activate(centerViewConstraints)
        NSLayoutConstraint.activate(accaountTextFieldsStackViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(separatorViewConstraints)
        NSLayoutConstraint.activate(leftLineViewConstraints)
        NSLayoutConstraint.activate(orLBConstraints)
        NSLayoutConstraint.activate(rightLineViewConstraints)
        NSLayoutConstraint.activate(bottomViewConstraints)
        NSLayoutConstraint.activate(buttonHorizontalStackViewConstraints)
        NSLayoutConstraint.activate(bottomLabelConstraints)
        NSLayoutConstraint.activate(signUpBtnConstraints)
    }
    
}

extension LogInView {
    
    //  Create Custom texField with left image
    private func creatCustomTextField(_ placeHolder: String, image: UIImage) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Const.Colors.backgroundColorLightDark
        textField.layer.cornerRadius = 15
        textField.textColor = .white
        textField.font = Const.Fonts.subTitle
        //  Create atrrinut for textfield placeHolder
        let attribut: [NSAttributedString.Key: Any] = [
            .foregroundColor: Const.Colors.tintColorGray,
            .font: Const.Fonts.subTitle!
        ]
        //  Add attributed placeHolder to the textField
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: attribut)
        
        //  Extension method of textfields To add left image
        textField.addLeft(image: image)
        return textField
    }
}

// MARK:- Button Action methods
extension LogInView {
    @objc private func accountButtonPressd(_ sender: UIButton) {
        delegate?.buttonPressd(sender)
    }
    
    @objc private func rememberBtnTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            sender.buttonSet(Const.Icon.squareIcon
                                .withTintColor(Const.Colors.tintColorHighlight, renderingMode: .alwaysOriginal))
            sender.tag = 0
        case 0:
            sender.buttonSet(Const.Icon.checkMarkIcon
                                .withTintColor(Const.Colors.tintColorHighlight, renderingMode: .alwaysOriginal))
            sender.tag = 1
        default:
            break
        }
    }
}
// MARK:- Extension Of UiTexfield
extension UITextField {
    //  Add button and his method on textfield
    fileprivate func enablePasswordToggle() {
        let size = CGSize(width: 20, height: 20)
        let button = UIButton(frame: CGRect(x: 0, y: center.y - (size.height / 2), width: size.width, height: size.height))
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 20)
        setPasswordToggleImage(button)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    //  TextField Button method
    @objc private func togglePasswordView(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        setPasswordToggleImage(sender)
    }
    
    //  Change the button image based on textfield text visibility
    private func setPasswordToggleImage(_ button: UIButton) {
        var image = UIImage()
        if isSecureTextEntry {
            image = Const.Icon.hidePasswordIcon
                .withTintColor(.white, renderingMode: .alwaysOriginal)
                .withConfiguration(UIImage.SymbolConfiguration.init(pointSize: 15))
        } else {
            image = Const.Icon.showPasswordIcon
                .withTintColor(.white, renderingMode: .alwaysOriginal)
                .withConfiguration(UIImage.SymbolConfiguration.init(pointSize: 15))
        }
        button.setImage(image, for: .normal)
    }
}
extension LogInView {
    func getEmali() -> String? {
        email.text
    }
    
    func getPassword() -> String? {
        password.text
    }
    func updateErrorLb(_ errorMassage: String) {
        self.errorLb.isHidden = false
        self.errorLb.text = errorMassage
    }
    
    func animateTextFields() {
        self.email.shake(count: 1, for: 0.07, withTranslation: 10)
        self.password.shake(count: 1, for: 0.07, withTranslation: 10)
    }
    func hideForgotPasswordBtn() {
        self.forgotPasswordBtn.isHidden = true
    }
}
