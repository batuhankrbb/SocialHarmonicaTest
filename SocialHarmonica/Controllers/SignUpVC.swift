//
//  SignUpVC.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit

class SignUpVC:UIViewController{
    //MARK: - Properties

    var signUpView = SignUpView()
    var viewModel = SignUpViewModel()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addTargets()
        adjustViewModelObservers()
        
    }

    //MARK: - Selectors

    @objc private func signUpClicked(){
        SignUpService.shared.createUser(viewModel: viewModel) { (error) in
            if let error = error{
                print("CREATING FAILED \(error.localizedDescription)")
                return
            }
                print("CREATED SUCCESFULLY")
            
        }
    }
    
    @objc private func selectPhoto(){
        let imgPickerController = UIImagePickerController()
        imgPickerController.sourceType = .photoLibrary
        imgPickerController.delegate = self
        imgPickerController.isEditing = true
        present(imgPickerController, animated: true, completion: nil)
    }
    
    @objc private func presentSignIn(){
        let signInVC = SignInVC()
        navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @objc private func textChanged(textfield:UITextField){
        switch textfield {
        case signUpView.fullNameTextField: viewModel.fullname = textfield.text
        case signUpView.usernameTextField: viewModel.username = textfield.text
        case signUpView.mailTextField    : viewModel.email = textfield.text
        case signUpView.passwordTextField: viewModel.password = textfield.text
        default:  break
    }
}
    
    
    //MARK: - Helpers
    
    private func configureUI(){
        navigationController?.navigationBar.isHidden = true
        setGradientBackground(color: ColorConst.customYellow.cgColor, color2: ColorConst.customBlue.cgColor)
        view.addSubview(signUpView)
        signUpView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func addTargets(){
        //        signUpView.fullNameTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        //        signUpView.mailTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        //        signUpView.passwordTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        //        signUpView.usernameTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        [signUpView.fullNameTextField,signUpView.mailTextField,signUpView.passwordTextField,signUpView.usernameTextField].forEach({textfield in
            textfield.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        })

        let gestureForPresentSignIn = UITapGestureRecognizer(target: self, action: #selector(presentSignIn))
        signUpView.signInPresentButton.addGestureRecognizer(gestureForPresentSignIn)
        
        let gestureForImage = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        signUpView.selectPhotoImageView.addGestureRecognizer(gestureForImage)
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
    }
    
    private func adjustViewModelObservers(){
        viewModel.isValid.assignObserver {(isvalid) in
            guard let isvalid = isvalid else {return}
            self.signUpView.changeButton(isvalid: isvalid)
        }
        viewModel.photo.assignObserver { (photo) in
            guard let photo = photo else {return}
            self.signUpView.selectPhotoImageView.image = photo
            self.signUpView.selectPhotoImageView.layer.cornerRadius = 12
            self.viewModel.checkDataIsValid()
        }
        
    }
    
    
}

extension SignUpVC:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let photo = info[.originalImage] as? UIImage{
            viewModel.photo.value = photo
            
        }
        dismiss(animated: true, completion: nil)
    }
}
