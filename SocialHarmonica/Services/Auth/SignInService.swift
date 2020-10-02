//
//  SignInService.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit
import Firebase

class SignInService{
    
    private init(){}
    
    static let shared = SignInService()
    
    func signIn(viewModel:SignInViewModel, completionHandler handler: @escaping (Error?) -> ()){
        viewModel.checkDataIsValid()
        guard viewModel.isValid.value == true else {handler(SHError.missingInformation);return}
        self.signInAuth(email: viewModel.email!, password: viewModel.password!) { (result, error) in
            if let error = error{
                handler(error)
                return
            }else{
                if result?.user.isEmailVerified == false{
                    handler(SHError.emailNotVerified)
                    try? Auth.auth().signOut()
                    return
                }
                handler(nil)
            }
        }
    }
    
    
    func forgetPassword(email:String, completionHandler handler: @escaping (Error?) -> ()){
        Auth.auth().sendPasswordReset(withEmail: email, completion: handler)
    }
    
    private func checkEmail(result:AuthDataResult,completionHandler handler: @escaping (Error?) -> ()){
        if result.user.isEmailVerified == false{
            try? Auth.auth().signOut()
            
            handler(SHError.emailNotVerified)
        }
    }
    
    private func signInAuth(email:String,password:String,completionHandler handler: @escaping (AuthDataResult?,Error?) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                debugPrint("Error occured in signIn \(error.localizedDescription)")
                handler(nil,error)
                return
            }
                handler(result,nil)
        }
    }
    
}


/*
 func signIn(viewModel:SignInViewModel, completionHandler handler: @escaping (Error?) -> ()){
     viewModel.checkDataIsValid()
     guard viewModel.isValid.value == true else {handler(SHError.missingInformation);return}
     self.signInAuth(email: viewModel.email!, password: viewModel.password!) { (result, error) in
         if let error = error{
             handler(error)
             return
         }
         self.checkEmail(result: result!) { (error) in
             if let error = error{
                 handler(error)
                 return
             }
         }
     }
 }
 */
