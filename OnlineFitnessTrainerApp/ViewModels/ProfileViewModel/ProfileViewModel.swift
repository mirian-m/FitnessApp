//
//  ProfileViewModel.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/12/23.
//

import Foundation

final class ProfileViewModel {
    
    private var profileData: ProfileModel? = ProfileModel() {
        didSet {
            self.updateUserData(profileData!)
        }
    }
    
    private func updateUserData(_ data: ProfileModel) {
        UserDataService.shared.updateName(data.name ?? "")
        UserDataService.shared.updateMail(data.email ?? "")
        UserDataService.shared.updatePhoneNumber(data.phoneNumber ?? "")
        UserDataService.shared.updateLastName(data.lastName ?? "")
        let data = encodeImageToData()
        UserDataService.shared.updatePicture(data)
    }
    
    //  Encode UIImage To data end return it
    private func encodeImageToData() -> Data {
        guard let data = profileData?.profilePhoto?.pngData() else { return Data() }
        return data
    }
    
    func getData() -> ProfileModel? { profileData }
    
    //  Save profile data method, if there isn't error, saves data in profileData Property and will update UserViewModel
    func save(_ data: ProfileModel) throws {
        if let error = checkValidationeOf(data) as? Errors {
            throw error
        }
        self.profileData = data
    }
}

extension ProfileViewModel {
    
    // MARK:- Validation Methods
    private func checkValidationeOf(_ data: ProfileModel) -> Error? {
        if !isAllFieldsFill(data) {
            return Errors.fields
        }
        if !isEmailValidate(data.email ?? "") {
            return Errors.email
        }
        if isPhoneNumberValidate(value: data.phoneNumber ?? "") {
            return Errors.phoneNumber
        }
        return nil
    }
    
    //  Mail Validation Method
    private func isEmailValidate(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //  Phone number Validation Method
    private func isPhoneNumberValidate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: value)
    }
    
    //  Checks if All fields are fill
    private func isAllFieldsFill(_ data: ProfileModel) -> Bool {
        if !data.email!.isEmpty, !data.lastName!.isEmpty, !data.name!.isEmpty, !data.phoneNumber!.isEmpty {
            return true
        }
        return false
    }
}
