//
//  SignInView.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit
class SignInView:UIView{
    
    //MARK: - Properties

     let mailTextField = UITextField()
     let passwordTextField = UITextField()
    
    var logoImageView:UIImageView = {
      var imgView = UIImageView()
      imgView.image = UIImage(systemName: "photo")
        imgView.contentMode = .scaleToFill
      imgView.clipsToBounds = true
      imgView.tintColor = Colors.customWhite
      return imgView
  }()
    
    private lazy var mailInputView:CustomInputView = {
        let lockImage = UIImage(systemName: "mail")
        let customAuthTF = CustomInputView(placeHolder: "e-Mail", imageView: UIImageView(image: lockImage),textField: mailTextField)
        return customAuthTF
    }()
    
    private lazy var passwordInputView:CustomInputView = {
        let lockImage = UIImage(systemName: "lock")
        let customAuthTF = CustomInputView(placeHolder: "Password", imageView: UIImageView(image: lockImage),textField: passwordTextField)
        passwordTextField.isSecureTextEntry = true
        return customAuthTF
    }()
    
    
    
     lazy var signInButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign In", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.setTitleColor(.gray, for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    
    lazy var signUpPresentButton:CustomLabel = {
       var customLabel = CustomLabel(text: "Don't you have an account? ", boldText: "Sign Up", size: 17)
        customLabel.isUserInteractionEnabled = true
        return customLabel
    }()

    lazy var forgetPasswordButton:CustomLabel = {
       var customLabel = CustomLabel(text: "Did you forget your password? ", boldText: "Reset Password", size: 13)
        customLabel.isUserInteractionEnabled = true
        return customLabel
    }()
   
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors

    //MARK: - Helpers
    
    private func configureUI(){
        
        addSubview(logoImageView)
        logoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(mailInputView)
        mailInputView.anchor(top: logoImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 50, bottom: 0, right: 70))
        
        addSubview(passwordInputView)
        passwordInputView.anchor(top: mailInputView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 50, bottom: 0, right: 70))

        addSubview(signInButton)
        signInButton.anchor(top: passwordInputView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 50, bottom: 0, right: 50))

        
        addSubview(signUpPresentButton)
        signUpPresentButton.setCenterX(anchor: centerXAnchor)
        signUpPresentButton.anchor(top: signInButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
        addSubview(forgetPasswordButton)
        forgetPasswordButton.setCenterX(anchor: centerXAnchor)
        forgetPasswordButton.anchor(top: signUpPresentButton.bottomAnchor, leading: nil, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: nil,padding: .init(top: 6, left: 0, bottom: 150, right: 0))

    }

     func changeButton(isvalid:Bool){
        signInButton.isEnabled = isvalid
        if isvalid{
            signInButton.setTitleColor(Colors.customYellow, for: .normal)
        }else{
            signInButton.setTitleColor(.gray, for: .normal)
        }
    }
    
}

