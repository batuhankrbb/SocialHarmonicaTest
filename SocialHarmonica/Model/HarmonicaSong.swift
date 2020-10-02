//
//  HarmonicaSong.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 1.10.2020.
//

import Foundation
import UIKit

class HarmonicaSong:CreateHarmonicaSong{
    
    var harmonicaType:HarmonicaTypes
    var harmonicaKey:HarmonicaKeys
    var songID:String
    var songName:String
    var commentNumber:Int
    var creationDate:Date
    var creatorID:String
    var tabs:String
    
    init(harmonicaType:HarmonicaTypes,harmonicaKey:HarmonicaKeys,songID:String,songName:String,commentNumber:Int,creationDate:Date,creatorID:String,tabs:String) {
        self.harmonicaKey = harmonicaKey
        self.harmonicaType = harmonicaType
        self.songID = songID
        self.songName = songName
        self.commentNumber = commentNumber
        self.creationDate = creationDate
        self.creatorID = creatorID
        self.tabs = tabs
    }
    
    func createHarmonicaSongViewModel() -> HarmonicaSongsViewModel {
        return HarmonicaSongsViewModel(harmonicaSong: self)
    }
}
