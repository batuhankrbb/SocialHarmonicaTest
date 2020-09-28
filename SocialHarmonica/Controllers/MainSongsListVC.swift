//
//  MainSongListVC.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit
import Firebase

class MainSongsListVC:UIViewController{
    
    //MARK: - Properties

    var authListenerHandle:AuthStateDidChangeListenerHandle?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustAuthListener()
    }

    //MARK: - Selectors


    //MARK: - Helpers

    private func adjustAuthListener(){
        authListenerHandle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil{
                let signUpController = SignUpVC()
                let navigationSignUp = UINavigationController(rootViewController: signUpController)
                navigationSignUp.modalPresentationStyle = .fullScreen
                self.present(navigationSignUp, animated: true, completion: nil)
            }
        })
    }
    
    
}










//MARK: - Properties


//MARK: - Lifecycle


//MARK: - Selectors


//MARK: - Helpers


