//
//  Ext+Date.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 1.10.2020.
//

import Foundation

extension Date{
    
        func formatDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy - MM - dd - hh:mm"
            return dateFormatter.string(from: self)
        }

}
