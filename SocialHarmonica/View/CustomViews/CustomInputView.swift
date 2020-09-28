//
//  CustomInputView.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit

class CustomInputView:UIView{
    
    
    //MARK: - Properties
    
    private lazy var bottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.88
        return view
    }()
    
    //MARK: - Lifecycle
    
    init(placeHolder:String, imageView:UIImageView,textField:UITextField) {
        super.init(frame: .zero)
        addSubview(textField)
        addSubview(bottomLine)
        addSubview(imageView)
        setHeight(number: 50)
        bottomLine.setHeight(number: 1)
        
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .clear
        textField.textColor = .white
        
        imageView.setDimension(size: .init(width: 24, height: 24))
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 2).isActive = true
        
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        imageView.setCenterY(anchor: centerYAnchor)
        
        textField.anchor(top: topAnchor, leading: imageView.trailingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 2))
        bottomLine.anchor(top: textField.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        tintColor = Colors.customWhite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
