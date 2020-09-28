//
//  SignInVC.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit

class SignInVC:UIViewController{
    //MARK: - Properties

    var signInView = SignInView()
    
    var viewModel = SignInViewModel()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addTargets()
        adjustViewModelObservers()
    }

    //MARK: - Selectors

    @objc private func forgetPassword(){
        let alert = UIAlertController(title: "Reset Password", message: "Please enter your e-mail adresses", preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "E-mail"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let resetPassword = UIAlertAction(title: "Reset", style: .default) { (action) in
            SignInService.shared.forgetPassword(email: (alert.textFields![0].text) ?? "") { (error) in
                if let error = error{
                    print("Error in Password forget \(error.localizedDescription)")
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(resetPassword)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func signInClicked(){
        SignInService.shared.signIn(viewModel: viewModel) { (error) in
            if let error = error{
                print("LOGIN FAILED \(error.localizedDescription)")
            }else{
                print("LOGIN SUCCEEDED")
            }
        }
    }
    
    @objc private func presentSignUp(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func textChanged(textfield:UITextField){
        switch textfield {
        case signInView.mailTextField: viewModel.email = textfield.text
        case signInView.passwordTextField: viewModel.password = textfield.text
        default: break
    }
}
    
    //MARK: - Helpers
    
    private func configureUI(){
        navigationController?.navigationBar.isHidden = true
        setGradientBackground(color: ColorConst.customYellow.cgColor, color2: ColorConst.customBlue.cgColor)
        view.addSubview(signInView)
        signInView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func addTargets(){
        signInView.mailTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        
        let gestureForPresentSignUp = UITapGestureRecognizer(target: self, action: #selector(presentSignUp))
        signInView.signUpPresentButton.addGestureRecognizer(gestureForPresentSignUp)
        
        signInView.signInButton.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
        
        let gestureForForgetPassword = UITapGestureRecognizer(target: self, action: #selector(forgetPassword))
        signInView.forgetPasswordButton.addGestureRecognizer(gestureForForgetPassword)
    }
    
    private func adjustViewModelObservers(){
        viewModel.isValid.assignObserver {(isvalid) in
            guard let isvalid = isvalid else {return}
            self.signInView.changeButton(isvalid: isvalid)
        }
    }
    
}
