//
//  SongsServices.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 1.10.2020.
//

import Foundation
import Firebase

class HarmonicaService{
    private init(){}
    
    static let shared = HarmonicaService()
    
    func uploadData(harmonicaSong:HarmonicaSong,completionHandler completion: @escaping (Error?) -> ()){
        let dataForUpload = [fs_HARMONICA.commentNumber:harmonicaSong.commentNumber,
                             fs_HARMONICA.creationDate:harmonicaSong.creationDate,
                             fs_HARMONICA.creatorID:harmonicaSong.creatorID,
                             fs_HARMONICA.harmonicaType:harmonicaSong.harmonicaType.rawValue,
                             fs_HARMONICA.songID:harmonicaSong.songID,
                             fs_HARMONICA.harmonicaKey:harmonicaSong.harmonicaKey.rawValue,
                             fs_HARMONICA.songName:harmonicaSong.songName,
                             fs_HARMONICA.tabs:harmonicaSong.tabs] as [String : Any]
        
        fs_HARMONICA.harmonicaPath.addDocument(data: dataForUpload,completion: completion)
    }
    
    func getData(completionHander handler: @escaping ([HarmonicaSong]) -> ()){
        fs_HARMONICA.harmonicaPath.addSnapshotListener { (snapshot, error) in
            var songsList = [HarmonicaSong]()
            if let error = error{
                debugPrint("Error occured in HarmonicaService \(error)")
                handler(songsList)
                return
            }
            guard let documents = snapshot?.documents else {return}
            
            for document in documents{
                let data = document.data()
                let commentNumber = data[fs_HARMONICA.commentNumber] as? Int
                let creationDate = (data[fs_HARMONICA.creationDate] as? Timestamp)?.dateValue()
                let creatorID = data[fs_HARMONICA.creatorID] as? String
                let harmonicaType = HarmonicaTypes(rawValue: data[fs_HARMONICA.harmonicaType] as? String ?? "Diatonic")
                
                let songID = data[fs_HARMONICA.songID] as? String
                let harmonicaKey = HarmonicaKeys(rawValue: data[fs_HARMONICA.harmonicaKey] as? String ?? "C")
                let songName = data[fs_HARMONICA.songName] as? String
                let tabs = data[fs_HARMONICA.tabs] as? String
                guard songID != nil, creatorID != nil else {continue}
                
                let harmonicaSong = HarmonicaSong(harmonicaType: harmonicaType!, harmonicaKey: harmonicaKey!, songID: songID!, songName: songName!, commentNumber: commentNumber!, creationDate: creationDate!, creatorID: creatorID!, tabs: tabs!)
                
                songsList.append(harmonicaSong)
            }
            handler(songsList)
        }
    }
    
    
}
