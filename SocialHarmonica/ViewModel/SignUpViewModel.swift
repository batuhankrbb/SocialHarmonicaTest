//
//  SignUpViewModel.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit


class SignUpViewModel{
    var email:String?{
        didSet{
            checkDataIsValid()
        }
    }
    var password:String?{
        didSet{
            checkDataIsValid()
        }
    }
    var fullname:String?{
        didSet{
            checkDataIsValid()
        }
    }
    var username:String?{
        didSet{
            checkDataIsValid()
        }
    }
    var photo = Bindable<UIImage>()

    var isValid = Bindable<Bool>()
    
   func checkDataIsValid(){
    isValid.value = email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false && photo.value != nil
    }
    
    
}
