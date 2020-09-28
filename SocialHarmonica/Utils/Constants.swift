//
//  Constants.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 28.09.2020.
//

import Foundation
import UIKit
import Firebase

enum ColorConst{
    static let customRed = UIColor.rgb(red: 243, green: 129, blue: 129)
    static let customYellow = UIColor.rgb(red: 252, green: 227, blue: 138)
    static let customWhite = UIColor.rgb(red: 246, green: 253, blue: 238)
    static let customBlue = UIColor.rgb(red: 149, green: 225, blue: 211)
    static let customLighYellow = UIColor.rgb(red: 234, green: 255, blue: 208)
}

enum StorageConst{
    static let userPhotos = "UserPhotos"
    static let randomPhotoName = "\(UUID().uuidString).jpg"
}

enum FirestoreConst{
    static let HARMONICA_SONGS = "HarmonicaSongs"
    static let USERS = "Users"
    static let FAVORITE_SONGS = "FavoriteSongs"
    
    static let biography = "Biography"
    static let creationDate = "Creationdate"
    static let fullName = "FullName"
    static let reputation = "Reputation"
    static let numberOfSongs = "NumberOfSongs"
    static let userID = "UserID"
    static let userMail = "UserMail"
    static let userName = "UserName"
    static let profilePhoto = "ProfilePhoto"
}

enum FirestorePathsConst{
    static let UsersPath = Firestore.firestore().collection(FirestoreConst.USERS)
}
