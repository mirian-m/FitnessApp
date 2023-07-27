//
//  CustomView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/30/23.
//

import UIKit

final class CustomView: UIView {
    
    private weak var delegate: Listener?
    
    // MARK:- Outlets
    private lazy var titleLb: UILabel = {
        let lb = UILabel()
        lb.font = Const.Fonts.title
        lb.textColor = Const.Colors.tintColorWight
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.7
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var subTitle: UILabel = {
        let lb = UILabel()
        lb.font = Const.Fonts.subTitle
        lb.textColor = Const.Colors.tintColorGray
        lb.numberOfLines = 0
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.8
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = .zero
        stack.addArrangedSubview(titleLb)
        stack.addArrangedSubview(subTitle)
        self.addSubview(stack)
        return stack
    }()
    
    lazy var centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        self.addSubview(stackView)
        return stackView
    }()
    
    private lazy var backButton: UIButton = {
        let btn = createButtonWith(title: "Back")
        return btn
    }()
    
    private lazy var continueButton: UIButton = {
        let btn = createButtonWith(title: "Continue")
        return btn
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.addArrangedSubview(backButton)
        stack.addArrangedSubview(continueButton)
        self.addSubview(stack)
        return stack
    }()
    
    // MARK:- View life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(title: String, subTitle: String, delegate: Listener) {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        titleLb.text = title
        self.subTitle.text = subTitle
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Const.Colors.backgroundColorDark
        adjustConstraints()
    }
    
}

extension CustomView {
    // MARK:- Private Methods
    
    private func adjustConstraints() {
        
        topStackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 30,
                            bottom: nil, paddingBottom: 0,
                            left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 30,
                            right: nil, paddingRight: 30,
                            width: 0,
                            height: self.frame.height * 0.1,
                            centerX: self.centerXAnchor,
                            centerY: nil
        )
        
        centerStackView.anchor(top: nil, paddingTop: 0,
                               bottom: nil, paddingBottom: 0,
                               left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 30,
                               right: nil, paddingRight: 30,
                               width: 0,
                               height: 400,
                               centerX: self.centerXAnchor,
                               centerY: self.centerYAnchor
        )
        
        bottomStackView.anchor(top: nil, paddingTop: 0,
                               bottom: self.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20,
                               left: centerStackView.leftAnchor, paddingLeft: 0,
                               right: nil, paddingRight: 0,
                               width: 0,
                               height: 40,
                               centerX: self.centerXAnchor,
                               centerY: nil
        )
    }
    private func createButtonWith(title: String) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = Const.Colors.highlightBackgroundColor
        btn.tintColor = Const.Colors.tintColorWight
        btn.setTitle(title, for: .normal)
        btn.layer.cornerRadius = Const.Radius.cornerRadiusForButton
        btn.addTarget(self, action: #selector(buttonPressd), for: .touchUpInside)
        return btn
    }
    
    @objc private func buttonPressd(_ sender: UIButton) {
        delegate?.buttonPressd(sender)
    }

}

extension CustomView {
    func changeButtonsTitleWith(_ buttonOneName: String, _ buttonTwoName: String) {
        self.backButton.setTitle(buttonOneName, for: .normal)
        self.continueButton.setTitle(buttonTwoName, for: .normal)
    }
}
