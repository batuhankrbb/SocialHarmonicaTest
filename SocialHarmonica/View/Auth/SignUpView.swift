//
//  SignUpView.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit

class SignUpView:UIView{
    
    //MARK: - Properties

     let mailTextField = UITextField()
     let passwordTextField = UITextField()
     let usernameTextField = UITextField()
     let fullNameTextField = UITextField()
    
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
    
    private lazy var usernameInputView:CustomInputView = {
        let lockImage = UIImage(systemName: "person")
        let customAuthTF = CustomInputView(placeHolder: "User Name", imageView: UIImageView(image: lockImage),textField: usernameTextField)
        return customAuthTF
    }()
    
    private lazy var fullNameInputView:CustomInputView = {
        let lockImage = UIImage(systemName: "person")
        let customAuthTF = CustomInputView(placeHolder: "Full Name", imageView: UIImageView(image: lockImage),textField: fullNameTextField)
        return customAuthTF
    }()
    
      var selectPhotoImageView:UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo")
        
        imgView.isUserInteractionEnabled = true
        imgView.tintColor = ColorConst.customWhite
        imgView.contentMode = .scaleAspectFill
    
        return imgView
    }()
    
     lazy var signUpButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.setTitleColor(.gray, for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    
    lazy var signInPresentButton:CustomLabel = {
       var customLabel = CustomLabel(text: "Do you already have an account? ", boldText: "Sign In", size: 17)
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
        
        
        let inputStackView = UIStackView(arrangedSubviews: [mailInputView,fullNameInputView,usernameInputView,passwordInputView])
        inputStackView.axis = .vertical
        inputStackView.spacing = 30
        
        addSubview(selectPhotoImageView)
        selectPhotoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 30, left: 0, bottom: 20, right: 0),size: .init(width: 320, height: 200))
        selectPhotoImageView.setCenterX(anchor: centerXAnchor)
    
        
        
        addSubview(inputStackView)
        inputStackView.anchor(top: selectPhotoImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 50, bottom: 0, right: 70))
        
        
        addSubview(signUpButton)
        signUpButton.anchor(top: inputStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 10, left: 50, bottom: 0, right: 50))
        
        addSubview(signInPresentButton)
        signInPresentButton.setCenterX(anchor: centerXAnchor)
        signInPresentButton.anchor(top: signUpButton.bottomAnchor, leading: nil, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: nil,padding: .init(top: 8, left: 0, bottom: 100, right: 0))
        
     
    }

     func changeButton(isvalid:Bool){
        signUpButton.isEnabled = isvalid
        if isvalid{
            signUpButton.setTitleColor(ColorConst.customYellow, for: .normal)
        }else{
            signUpButton.setTitleColor(.gray, for: .normal)
        }
    }
}

