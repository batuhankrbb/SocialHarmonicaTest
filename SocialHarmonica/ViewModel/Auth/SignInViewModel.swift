//
//  SignInViewModel.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit

class SignInViewModel{
    
    var email:String?{
        didSet{
            checkDataIsValid()
            email = email?.lowercased()
        }
    }
    
    var password:String?{
        didSet{
            checkDataIsValid()
        }
    }
    
    var isValid = Bindable<Bool>()
    
    func checkDataIsValid(){
        isValid.value = email?.isEmpty == false && password?.isEmpty == false
    }
}
