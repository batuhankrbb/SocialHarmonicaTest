//
//  HarmonicaSongDetailsView.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 2.10.2020.
//

import Foundation
import UIKit

class HarmonicaSongDetailsView:UIView{
    
    //MARK: - Properties

    lazy var tabsTextView:UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.isSelectable = false
        txt.backgroundColor = .white
        txt.textColor = .black
        return txt
    }()
    
    lazy var songNameLabel:UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var songDateLabel:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var commentCountLabel:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var voiceButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = ColorConst.customWhite
        btn.setTitleColor(ColorConst.customYellow, for: .normal)
        btn.setTitle("CLICK VOICE MESSAGE", for: .normal)
        btn.setTitle("RECORDING", for: .highlighted)
        return btn
    }()
    
    lazy var commentTextField:UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Comment"
        return textField
    }()

    //MARK: - Lifecycle
     init(song: HarmonicaSong) {
        super.init(frame: .zero)
        configureUI()
        configureComponents(song: song)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors


    //MARK: - Helpers
    private func configureUI(){
        backgroundColor = ColorConst.customRed
        
        addSubview(songNameLabel)
        songNameLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(tabsTextView)
        tabsTextView.anchor(top: songNameLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 16, left: 6, bottom: 0, right: 6))
        tabsTextView.setHeight(number: UIScreen.main.bounds.size.height * 0.35)
        
        addSubview(commentCountLabel)
        commentCountLabel.anchor(top: tabsTextView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 4, left: 12, bottom: 0, right: 0))
        
        addSubview(songDateLabel)
        songDateLabel.anchor(top: tabsTextView.bottomAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 4, left: 0, bottom: 0, right: 12))
        
        addSubview(voiceButton)
        voiceButton.anchor(top: songDateLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 20, left: 20, bottom: 60, right: 20))
        
        
    }
    
    private func configureComponents(song:HarmonicaSong){
        songNameLabel.text = song.songName
        commentCountLabel.text = "Comment: \(song.commentNumber)"
        tabsTextView.text = song.tabs
        songDateLabel.text = song.creationDate.formatDate()
    }
}
