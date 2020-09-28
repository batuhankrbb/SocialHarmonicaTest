//
//  Bindable.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation

class Bindable<K>{
    
    var value:K?{
        didSet{
            observer?(value)
        }
    }
    
    var observer: ((K?) -> Void)?
    
    func assignObserver(observer: @escaping ((K?) -> Void)){
        self.observer = observer
    }
}
