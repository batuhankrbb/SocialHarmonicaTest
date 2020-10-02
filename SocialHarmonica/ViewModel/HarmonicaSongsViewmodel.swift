//
//  HarmonicaSongsViewmodel.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 1.10.2020.
//

import Foundation
import UIKit

protocol CreateHarmonicaSong {
    func createHarmonicaSongViewModel() -> HarmonicaSongsViewModel
}

class HarmonicaSongsViewModel{
    var songName:String
    var songDate:String
    var commentNumber:String
    var songID:String
    
    init(harmonicaSong:HarmonicaSong) {
        songName = harmonicaSong.songName
        songDate = harmonicaSong.creationDate.formatDate()
        commentNumber = "\(harmonicaSong.commentNumber)"
        songID = harmonicaSong.songID
    }
    
}
