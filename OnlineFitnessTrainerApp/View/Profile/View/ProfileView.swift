//
//  ProfileView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/6/23.
//
import UIKit
final class ProfileView: UIView {
    // Const profile Imge Height
    private let profileIamgeHeight: CGFloat = 100
    
    // MARK:- Create Autlets programaticaly
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = profileIamgeHeight / 2
        imageView.image = Const.Icon.personIcon
            .withTintColor(.gray, renderingMode: .alwaysOriginal)
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var eddButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 7
        btn.backgroundColor = Const.Colors.highlightBackgroundColor
        btn.setImage(Const.Icon.addIcon
                        .withTintColor(.black, renderingMode: .alwaysOriginal)
                        .withConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .bold)), for: .normal
        )
        btn.addTarget(self, action: #selector(eddButtonTapped), for: .touchUpInside)
        self.addSubview(btn)
        return btn
    }()
    
    private(set) lazy var fullNameTextField: UITextField = {
        let placeHolder = "Name"
        let textField = createTextFiled(with: placeHolder)
        return textField
    }()
    
    private(set) lazy var lastNameTextField: UITextField = {
        let placeHolder = "Last name"
        let textField = createTextFiled(with: placeHolder)
        return textField
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let placeHolder = "Email"
        let textField = createTextFiled(with: placeHolder)
        textField.addRight(image: Const.Icon.emailIcon)
        return textField
    }()
    
    private(set) lazy var phoneNumberTextField: UITextField = {
        let placeHolder = "Phone Number"
        let textField = createTextFiled(with: placeHolder)
        return textField
    }()
    
    private lazy var stackViewForTextField: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        stack.addArrangedSubview(fullNameTextField)
        stack.addArrangedSubview(lastNameTextField)
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(phoneNumberTextField)
        self.addSubview(stack)
        return stack
    }()
    
    //  MARK:- View lifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
    }
}
// MARK:- Extension
extension ProfileView {
    
    // MARK:- Private Methods
    private func createTextFiled(with placeHolder: String) -> UITextField {
        let textField = UITextField()
        textField.addLeftPaddingPoint(15)
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                                                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)
                                                             ]
        )
        textField.backgroundColor = Const.Colors.backgroundColorLightDark
        textField.textColor = Const.Colors.tintColorWhite
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        return textField
    }
    
    private func adjustConstraints() {
        
        profileImageView.anchor(top: self.topAnchor, paddingTop: 10,
                                bottom: stackViewForTextField.topAnchor, paddingBottom: 10,
                                left: nil, paddingLeft: 0,
                                right: nil, paddingRight: 0,
                                width: profileIamgeHeight,
                                height: profileIamgeHeight,
                                centerX: self.centerXAnchor,
                                centerY: nil
        )
        let eddButtonConstraints = [ eddButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -30),
                                     eddButton.heightAnchor.constraint(equalToConstant: 25),
                                     eddButton.widthAnchor.constraint(equalTo: eddButton.heightAnchor),
                                     eddButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(eddButtonConstraints)
        
        stackViewForTextField.anchor(top: nil, paddingTop: 0,
                                     bottom: self.bottomAnchor, paddingBottom: 10,
                                     left: self.leftAnchor, paddingLeft: 0,
                                     right: nil, paddingRight: 0,
                                     width: 0,
                                     height: 0,
                                     centerX: self.centerXAnchor,
                                     centerY: nil
        )
    }
    
    // MARK:- Post Notification To Change Profile Photo
    @objc private func eddButtonTapped() {
        NotificationCenter.default.post(name: .changeProfilePhoto, object: nil)
    }
    
    func updateProfile(image: UIImage) {
        self.profileImageView.image = image
    }
}
