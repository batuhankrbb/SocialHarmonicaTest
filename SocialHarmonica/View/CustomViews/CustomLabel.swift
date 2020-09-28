//
//  CustomLabel.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit

class CustomLabel:UILabel{
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
     init(text:String,boldText:String,size:CGFloat) {
        super.init(frame: .zero)
        let attrText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: size)])
        attrText.append(NSAttributedString(string: boldText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: size + 1, weight: .bold)]))
        attributedText = attrText
        textColor = Colors.customWhite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI(){
        
    }
    
}
