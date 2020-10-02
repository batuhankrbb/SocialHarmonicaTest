//
//  SongCell.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 1.10.2020.
//

import Foundation
import UIKit

class SongCell:UITableViewCell{
    
    //MARK: - Properties
    
    var songLabel:UILabel = {
       var lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    var commentImage:UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "person")
        return imgView
    }()
    
    var commentLabel:UILabel = {
        var lbl = UILabel()
         lbl.font = UIFont.boldSystemFont(ofSize: 12)
         lbl.textColor = .black
         return lbl
    }()
    
    var dateLabel:UILabel = {
        var lbl = UILabel()
         lbl.font = UIFont.boldSystemFont(ofSize: 12)
         lbl.textColor = .black
         return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        backgroundColor = ColorConst.customLighYellow
        addSubview(songLabel)
        addSubview(commentLabel)
        addSubview(commentImage)
        commentImage.setDimension(size: .init(width: 30, height: 30))
        
        songLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        commentImage.anchor(top: songLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 4, left: 20, bottom: 2, right: 0))
        
        commentLabel.anchor(top: songLabel.bottomAnchor, leading: commentImage.trailingAnchor, bottom: bottomAnchor, trailing: nil,padding: .init(top: 4, left: 20, bottom: 2, right: 0))
        
        addSubview(dateLabel)
        
        dateLabel.anchor(top: songLabel.bottomAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 4, left: 0, bottom: 2, right: 20))
        
        
    }
    
    func adjustUI(harmonicaSongVM:HarmonicaSongsViewModel){
        songLabel.text = harmonicaSongVM.songName
        commentLabel.text = harmonicaSongVM.commentNumber
        dateLabel.text = harmonicaSongVM.songDate
    }
}
