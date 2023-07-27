//
//  GenderView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import UIKit

final class GenderView: UIView {
    
    private weak var delegate: Listener?
    
    // MARK:- Outlets
    private lazy var title: UILabel = {
        let lb = UILabel()
        lb.font = Const.Fonts.title
        lb.textColor = Const.Colors.tintColorWight
        lb.text = "Tell Us About Yourself"
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var subTitle: UILabel = {
        let lb = UILabel()
        lb.font = Const.Fonts.subTitle
        lb.textColor = Const.Colors.tintColorGray
        lb.minimumScaleFactor = 0.6
        lb.numberOfLines = 0
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var genderMaleBtn: UIButton = {
        let btn = self.createGenderButtonWith(title: "Male", image: Const.Icon.maleIcon)
        btn.tag = 0
        return btn
    }()
    
    private lazy var genderFemaleBtn: UIButton = {
        let btn = self.createGenderButtonWith(title: "Female", image: Const.Icon.feMaleIcon)
        btn.tag = 1
        return btn
    }()
    
    private lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(subTitle)
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var centerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.addArrangedSubview(genderMaleBtn)
        stack.addArrangedSubview(genderFemaleBtn)
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 70
        stack.alignment = .center
        stack.addArrangedSubview(topStackView)
        stack.addArrangedSubview(centerStackView)
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var continueButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.backgroundColor = Const.Colors.highlightBackgroundColor
        btn.setTitle("Continue", for: .normal)
        btn.tintColor = Const.Colors.tintColorWight
        btn.tag = 2
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(buttonPressd), for: .touchUpInside)
        return btn
    }()
    
    // MARK:- View life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Const.Colors.backgroundColorDark
        adjustConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String?, delegate: Listener?) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.subTitle.text = text
        self.delegate = delegate
    }
    
    // MARK:- Private methods
    private func createGenderButtonWith(title: String, image: UIImage) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        let view = self.createCustomViewForButtonWith(title, image)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = Const.Radius.circleRadius
        btn.addSubview(view)
        btn.addTarget(self, action: #selector(buttonPressd), for: .touchUpInside)
        return btn
    }
    
    private func createCustomViewForButtonWith(_ title: String, _ image: UIImage) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        view.isUserInteractionEnabled = false
        let label = UILabel()
        label.text = title
        label.textColor = Const.Colors.tintColorWight
        let imageView = UIImageView()
        imageView.image = image.withTintColor(.white)
        imageView.contentMode = .center
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        stackView.frame = view.bounds
        view.addSubview(stackView)
        return view
    }
    
    @objc private func buttonPressd(sender: UIButton) {
        if sender.currentTitle != "Continue" {
            resetButtonBackground()
        }
        delegate?.buttonPressd(sender)
    }
    
    private func resetButtonBackground() {
        genderMaleBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        genderFemaleBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    private func adjustConstraints() {
        let topStackViewConstraints = [topStackView.heightAnchor.constraint(equalToConstant: 100)]
        NSLayoutConstraint.activate(topStackViewConstraints)
        
        centerStackView.anchor(top: nil, paddingTop: 0,
                               bottom: nil, paddingBottom: 0,
                               left: nil, paddingLeft: 0,
                               right: nil, paddingRight: 0,
                               width: 140,
                               height: 300,
                               centerX: nil,
                               centerY: nil
        )
        
        stackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 20,
                         bottom: nil, paddingBottom: 0,
                         left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 20,
                         right: nil, paddingRight: 0,
                         width: 0,
                         height: 0,
                         centerX: self.centerXAnchor,
                         centerY: nil
        )
        
        continueButton.anchor(top: nil, paddingTop: 0,
                              bottom: self.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20,
                              left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 20,
                              right: nil, paddingRight: 0,
                              width: 0,
                              height: 50,
                              centerX: self.centerXAnchor,
                              centerY: nil
        )
    }
}
