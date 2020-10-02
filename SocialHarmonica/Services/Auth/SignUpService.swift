//
//  AuthService.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit
import Firebase

class SignUpService{
    
    private init(){}
    
    static let shared = SignUpService()
    
    func createUser(viewModel:SignUpViewModel, completionHandler handler: @escaping (Error?) -> ()){
        viewModel.checkDataIsValid()
        guard viewModel.isValid.value == true else {handler(SHError.missingInformation); return}
        
        //AUTH USER
        self.createUserAuth(email: viewModel.email!, password: viewModel.password!) { (result, error) in
            if let error = error{
                handler(error)
                return
            }
            
            // STORAGE PHOTO
            self.uploadPhoto(photo: viewModel.photo.value!, result: result!) { (error, url) in
                if let error = error{
                    handler(error)
                    return
                }
                
                //CHANGE REQUEST
                self.profileChangeRequest(username: viewModel.username!, result: result, photoURL: url!) { (error) in
                    if let error = error{
                        handler(error)
                        return
                    }
                }
                    
                    //UPLOAD FIREBASE
                    self.saveToFirestore(result: result!, fullname: viewModel.fullname!, mail: viewModel.email!, username: viewModel.username!, url: url!) { (error) in
                        if let error = error{
                            handler(error)
                            return
                        }
                    }
                    
                    //SENDING VERIFICATION
                    self.sendEmailVerification(result: result!) { (error) in
                        if let error = error{
                            handler(error)
                            return
                        }
                    }
            }
            handler(nil)
        }
        
    }
    
    private func sendEmailVerification(result:AuthDataResult, completionHandler handler: @escaping (Error?) -> ()){
        result.user.sendEmailVerification(completion: { (error) in
            if let error = error{
                debugPrint("Error occured in sendEmailVerification")
                self.deleteUser(user: result.user)
                handler(error)
                return
            }
        })
    }
    
    private func profileChangeRequest(username:String,result:AuthDataResult?,photoURL:URL,completionHandler handler: @escaping (Error?) -> ()){
        let changeRequest = result?.user.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.photoURL = photoURL
        changeRequest?.commitChanges(completion: { (error) in
            if let error = error{
                debugPrint("Error occured in ChangeRequest \(error.localizedDescription)")
                self.deleteUser(user: result!.user)
                handler(error)
                return
            }
        })
    }
    
    
    
    private  func uploadPhoto(photo:UIImage,result:AuthDataResult, completionHandler handler: @escaping (Error?,URL?) -> ()){
        let reference =  Storage.storage().reference(withPath: StorageConst.userPhotos).child(StorageConst.randomPhotoName)
        let data = photo.jpegData(compressionQuality: 0.6)
        //Putting Photo
        reference.putData(data!, metadata: nil) { (metadata, error) in
            if let error = error{
                debugPrint("Error occured in StoragePhoto \(error.localizedDescription)")
                self.deleteUser(user: result.user)
                handler(error,nil)
                return
            }
            //Getting Download URL
            reference.downloadURL { (url, error) in
                if let error = error{
                    debugPrint("Error occured in StoragePhoto2 \(error.localizedDescription)")
                    self.deleteUser(user: result.user)
                    handler(error,nil)
                    return
                }
                if let url = url{
                    handler(nil,url)
                }else{
                    debugPrint("Error occured in StoragePhoto3 \(SHError.damagedPhotoURL)")
                    handler(SHError.damagedPhotoURL,nil)
                    return
                }
                
            }
        }
    }
    
    private func saveToFirestore(result:AuthDataResult,fullname:String,mail:String,username:String,url:URL,completionHandler handler: @escaping (Error?) -> ()){
        let dataForSave = [fs_PROFILE.biography: "Hello, I'm using Social Harmonica!",
                           fs_PROFILE.creationDate:Date(),
                           fs_PROFILE.fullName:fullname,
                           fs_PROFILE.numberOfSongs:0,
                           fs_PROFILE.reputation:0,
                           fs_PROFILE.userID:result.user.uid,
                           fs_PROFILE.userMail:mail,
                           fs_PROFILE.userName:username,
                           fs_PROFILE.profilePhoto:url.absoluteString] as [String : Any]
        
        fs_PROFILE.UsersPath.document(result.user.uid).setData(dataForSave) { (error) in
            if let error = error{
                debugPrint("Error occured in saveToFirestore \(error.localizedDescription)")
                self.deleteUser(user: result.user)
                handler(error)
                return
            }
        }
    }
    
    private func deleteUser(user:User){
        fs_PROFILE.UsersPath.document(user.uid).delete()
        if let photoURL = user.photoURL?.absoluteString{
            let reference = Storage.storage().reference(forURL: photoURL)
            reference.delete()
        }
        user.delete()
    }
    
    private func createUserAuth(email:String,password:String, completionHandler handler: @escaping (AuthDataResult?,Error?) -> ()){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                debugPrint("Error occured in CreateUserAuth \(error.localizedDescription)")
                handler(nil,error)
                return
            }else{
                handler(result,nil)
            }
            
        }
    }
    
}


