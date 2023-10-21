//
//  Constants.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/29/23.
//

import Foundation
import UIKit

enum Const {
    enum Fonts {
        static let title = UIFont(name: "HelveticaNeue", size: 30)
        static let largTitle = UIFont(name: "HelveticaNeue-Bold", size: 60)
        static let subTitle = UIFont(name: "HelveticaNeue-Bold", size: 13)
    }
    enum Colors {
        static let highlightBackgroundColor = #colorLiteral(red: 0.4064723253, green: 0.2563842833, blue: 1, alpha: 1)
        static let backgroundColorDark = #colorLiteral(red: 0.09379886836, green: 0.10151539, blue: 0.1264217198, alpha: 1)
        static let tintColorWhite = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let tintColorGray = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let tintColorHighlight = #colorLiteral(red: 0.4064723253, green: 0.2563842833, blue: 1, alpha: 1)
        static let backgroundColorLightDark = #colorLiteral(red: 0.2073960006, green: 0.2191228569, blue: 0.2481985986, alpha: 1).withAlphaComponent(0.5)
    }
    enum Icon {
        static let maleIcon = UIImage(named: "MaleIcon") ?? UIImage()
        static let feMaleIcon = UIImage(named: "FemaleIcon") ?? UIImage()
        static let squareIcon = UIImage(systemName: "square") ?? UIImage()
        static let checkMarkIcon = UIImage(systemName: "checkmark.square.fill") ?? UIImage()
        static let personIcon = UIImage(systemName: "person.circle.fill") ?? UIImage()
        static let addIcon = UIImage(systemName: "highlighter") ?? UIImage()
        static let emailIcon = UIImage(systemName: "envelope.fill") ?? UIImage()
        static let facebookIcon = UIImage(named: "facebook-icon") ?? UIImage()
        static let googleIcon = UIImage(named: "google-icon") ?? UIImage()
        static let appleIcon = UIImage(named: "apple-icon") ?? UIImage()
        static let lockIcon = UIImage(systemName: "lock") ?? UIImage()
        static let hidePasswordIcon = UIImage(systemName: "eye.slash.fill") ?? UIImage()
        static let showPasswordIcon = UIImage(systemName: "eye.fill") ?? UIImage()
        static let homeIcon = UIImage(systemName: "house") ?? UIImage()
        static let homeFillIcon = UIImage(systemName: "house.fill") ?? UIImage()
        static let goFitIcon = UIImage(named: "hantel") ?? UIImage()
        static let bellIcon = UIImage(systemName: "bell") ?? UIImage()
        static let bellFillIcon = UIImage(systemName: "bell.fill") ?? UIImage()
        static let bookmarkIcon = UIImage(systemName: "bookmark") ?? UIImage()
        static let bookmarkFillIcon = UIImage(systemName: "bookmark.fill") ?? UIImage()
    }
    enum Radius {
        static let circleRadius: CGFloat = 70
        static let cornerRadiusForButton: CGFloat = 15
    }
    
    enum Size {
        static let pickerViewRowHeight: CGFloat = 60
        static let pickerViewRowWidth: CGFloat = 60
    }
    
    enum FStore {
        static let collection = "UserData"
        
        enum Fields {
           static let name = "First Name"
           static let lastName = "Last Name"
           static let mail = "Email"
           static let gender = "Gender"
           static let age = "Age"
           static let weight = "Weight"
           static let height = "Height"
           static let goal = "Goal"
           static let profilePicture = "Picture"
           static let physicalActivityLevel = "Physical level"
           static let phoneNumber = "Phone Number"
        }
    }
    enum APIData {
        static let baseUrl = "https://api.api-ninjas.com/v1/exercises?"
        static let APIKey = "fdxc4b8DadzBBEg9YirSRQ==L3Ej6hCAtN2hk3r8"
    }
}
