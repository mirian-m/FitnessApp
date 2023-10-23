//
//  Extensions.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import UIKit

// MARK:- Extension UIView
extension UIView {
    
    //  Set constraints
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor? = nil,
                paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor? = nil,
                paddingRight: CGFloat,
                width: CGFloat,
                height: CGFloat,
                centerX: NSLayoutXAxisAnchor? = nil,
                centerY: NSLayoutYAxisAnchor? = nil
    ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // Use the centerX parameter to set the centerXAnchor constraints
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        // Use the centerY parameter to set the centerYAnchor constraints
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        // Use the top parameter to set the top constarint
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        // Use the bottom parameter to set the bottom constarint
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        // Use the right parameter to set the right constarint
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        // Use the left parameter to set the left constarint
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        // Use the width parameter to set the top constarint
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        // Use the height parameter to set the top constarint
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
// MARK:- Extension Gender
extension Gender {
    
    //  get type rowValue in string
    func getGenderToString() -> String {
        switch self.rawValue {
        case 0:
            return "Male"
        case 1:
            return "Female"
        default:
            return ""
        }
    }
}

extension UITextField {
    func addLeftPaddingPoint(_ amount: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = .always
    }
    
    func addRightPaddingPoint(_ amount: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: 1))
        self.rightView = padding
        self.rightViewMode = .always
    }
    
    func addLeft(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: center.y - 10, width: 30, height: 20))
        let image = image.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        iconView.contentMode = .center
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: frame.height))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func addRight(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: center.y - 10, width: 30, height: 20))
        let image = image.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        iconView.contentMode = .center
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: frame.height))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

extension Notification.Name {
    static let changeProfilePhoto = Notification.Name("Change Profile Photo")
    static let showOrHidePassword = Notification.Name("Show Or Hide Password")
}

extension UIButton {
    func buttonSet(_ image: UIImage, _ title: String = "") {
        setImage(image, for: .normal)
        if title != "" {
            setTitle(title, for: .normal)
        }
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        contentHorizontalAlignment = .center
        imageView?.contentMode = .scaleAspectFill
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

public extension UIView {

    func shake(count: Float = 4, for duration: TimeInterval = 0.5, withTranslation translation: Float = 5) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
