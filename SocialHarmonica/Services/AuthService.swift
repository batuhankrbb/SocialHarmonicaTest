//
//  AuthService.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit
import Firebase

class AuthService{

    private init(){}
    
    static let shared = AuthService()
    
    func createUser(viewModel:SignUpViewModel){
        viewModel.checkDataIsValid()
        guard viewModel.isValid.value == true else {return}
       
        //AUTH USER
        Auth.auth().createUser(withEmail: viewModel.email!, password: viewModel.password!) { (result, error) in
            if let error = error{
               debugPrint("Error occured in CreateUserAuth \(error)")
                return
            }
            
        // STORAGE PHOTO
            Storage.storage().reference(withPath: StorageConst.userPhotos).child(StorageConst.randomPhotoName)
        
    }
    

    }
    
}
