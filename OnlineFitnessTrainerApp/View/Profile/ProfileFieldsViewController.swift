//
//  ProfileViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/6/23.
//

import UIKit

final class ProfileFieldsViewController: UIViewController {
    
    // MARK:- Private Property
    private let profileView = ProfileView()
    private var profileImage: UIImage!
    private let manager = ProfileViewModelManager()
    
    // MARK:- View Controller Life Cycle
    override func loadView() {
        super.loadView()
        addCustomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changePhoto), name: .changeProfilePhoto, object: nil)
    }
}

// MARK:- EXTESIONS

extension ProfileFieldsViewController {
    // MARK:- Private Methods
    private func addCustomView() {
        
        self.view = CustomView(title: "Fill Your Profile",
                               subTitle: "Don't worry you can always change it later, or you can skip it for now",
                               delegate: self
        )
        guard let customView = (self.view as? CustomView) else { return }
        customView.changeButtonsTitleWith("Skip", "Start")
        customView.centerStackView.addArrangedSubview(profileView)
    }
    
    private func saveProfileData() {
        let fullName = profileView.fullNameTextField.text
        let email = profileView.emailTextField.text
        let phoneNumber = profileView.phoneNumberTextField.text
        let lastName = profileView.lastNameTextField.text
        let profileData = ProfileModel(profilePhoto: profileImage,
                                       name: fullName,
                                       lastName: lastName,
                                       email: email,
                                       phoneNumber: phoneNumber
        )
        
        do {
            try manager.save(profileData)
        } catch {
            guard let errorMassege = error as? Errors else { return }
            getAlert(with: errorMassege.rawValue)
        }
    }
}
// MARK:- Protocol Method Extension
extension ProfileFieldsViewController: Listener {
    func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Start":
            saveProfileData()
        default:
            break
        }
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}

// MARK:- ImagePicker Methods Extension
extension ProfileFieldsViewController {
    @objc private func changePhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ProfileFieldsViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        profileImage = image
        profileView.updateProfile(image: image)
        dismiss(animated: true, completion: nil)
    }
}

// MARK:- Alert Extension
extension ProfileFieldsViewController {
    private func getAlert(with errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
