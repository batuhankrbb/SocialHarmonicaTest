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
    
      lazy var selectPhotoImageView:UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo")
        imgView.backgroundColor = .red
        imgView.isUserInteractionEnabled = true
        imgView.tintColor = ColorConst.customWhite
        imgView.contentMode = .scaleAspectFit
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
     lazy var signUpButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        btn.setTitleColor(.gray, for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    
    lazy var signInPresentButton:CustomLabel = {
       var customLabel = CustomLabel(text: "Do you already have an account? ", boldText: "Sign In", size: 17)
        customLabel.isUserInteractionEnabled = true
        return customLabel
    }()
    
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
        
        let buttonStackView = UIStackView(arrangedSubviews: [signUpButton,signInPresentButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 6
        
        
        selectPhotoImageView.setHeight(number: UIScreen.main.bounds.size.height * 0.3)
        let inputStackView = UIStackView(arrangedSubviews: [mailInputView,fullNameInputView,usernameInputView,passwordInputView,buttonStackView])
        inputStackView.axis = .vertical
        inputStackView.spacing = 25
        
        
        
        
        addSubview(selectPhotoImageView)
        selectPhotoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 30, bottom: 0, right: 30))
        
        addSubview(inputStackView)
        inputStackView.anchor(top: selectPhotoImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 30, bottom: 0, right: 30))
        
       
        
        
     
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
