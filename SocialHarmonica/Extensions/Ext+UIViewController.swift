//
//  Ext+UIViewController.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit
import JGProgressHUD
extension UIViewController{
    // show hud(text and blablabla)
    
    // make gradient  (color1,color2)
    
    func setGradientBackground(color:CGColor,color2:CGColor){
        let gradient = CAGradientLayer()
        gradient.locations = [0,1]
        gradient.colors = [color,color2]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
    
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show:Bool, withText text:String? = "Loading"){
        view.endEditing(true)
        UIViewController.hud.textLabel.text = text
        if show{
            UIViewController.hud.show(in: view)
        }else{
            UIViewController.hud.dismiss()
        }
    }
}
