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

    @objc fileprivate func presentSignUp(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func textChanged(textfield:UITextField){
        switch textfield {
        case signInView.mailTextField: viewModel.email = textfield.text
        case signInView.passwordTextField: viewModel.password = textfield.text
        default: break
    }
}
    
    //MARK: - Helpers
    
    private func configureUI(){
        navigationController?.navigationBar.isHidden = true
        setGradientBackground(color: Colors.customYellow.cgColor, color2: Colors.customBlue.cgColor)
        view.addSubview(signInView)
        signInView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func addTargets(){
        signInView.mailTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(textChanged(textfield:)), for: .editingChanged)
        
        let gestureForPresentSignUp = UITapGestureRecognizer(target: self, action: #selector(presentSignUp))
        signInView.signUpPresentButton.addGestureRecognizer(gestureForPresentSignUp)
    }
    
    private func adjustViewModelObservers(){
        viewModel.isValid.assignObserver {(isvalid) in
            guard let isvalid = isvalid else {return}
            self.signInView.changeButton(isvalid: isvalid)
        }
    }
    
}
