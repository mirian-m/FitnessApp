//
//  WelcomView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/26/23.
//

import UIKit

final class WelcomView: UIView {
    
    // MARK:- Outlet Programaticaly
    private lazy var workOutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "bumpsted")
        imageView.frame = self.bounds
        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.addArrangedSubview(welcomLb)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(aboutApp)
        return stack
    }()
    
    private lazy var welcomLb: UILabel = {
        let lb = UILabel()
        lb.text = "Welcome to 👋"
        lb.font = Const.Fonts.title
        lb.textColor = .white
        return lb
    }()
    
    private lazy var name: UILabel = {
        let lb = UILabel()
        lb.text = "Gofit"
        lb.font = Const.Fonts.largTitle
        lb.textColor = .white
        return lb
    }()
    
    private lazy var aboutApp: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "The best fitness App in this country to accompany your sports"
        lb.font = Const.Fonts.subTitle
        lb.textColor = Const.Colors.tintColorWhite
        return lb
    }()
    
    // MARK:- View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Const.Colors.backgroundColorDark
        self.addSubview(workOutImageView)
        self.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
        setGradient()
    }
    
    // MARK:- Constraints Method
    private func adjustConstraints() {
        
        workOutImageView.anchor(top: self.topAnchor, paddingTop: 0,
                                bottom: self.bottomAnchor, paddingBottom: 0,
                                left: self.leftAnchor, paddingLeft: 0,
                                right: self.rightAnchor, paddingRight: 0,
                                width: 0,
                                height: 0,
                                centerX: nil,
                                centerY: nil
        )
        
        stackView.anchor(top: nil, paddingTop: 0,
                         bottom: self.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20,
                         left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 45,
                         right: nil, paddingRight: 0,
                         width: 0,
                         height: self.frame.height * 0.29,
                         centerX: self.centerXAnchor,
                         centerY: nil
        )
    }
    
    private func setGradient() {
        let graidient = CAGradientLayer()
        graidient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        graidient.frame = self.bounds
        workOutImageView.layer.addSublayer(graidient)
    }
}
