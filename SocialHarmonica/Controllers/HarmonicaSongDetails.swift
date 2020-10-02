//
//  HarmonicaSongDetails.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 2.10.2020.
//

import Foundation
import UIKit

class HarmonicaSongDetails:UIViewController{

    //MARK: - Properties

    var harmonicaSong:HarmonicaSong?
    var harmonicaDetailsView:HarmonicaSongDetailsView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(song: harmonicaSong)
    }

    //MARK: - Selectors


    //MARK: - Helpers
    
    private func configureUI(song:HarmonicaSong?){
        guard let song = song else {return}
        harmonicaDetailsView = HarmonicaSongDetailsView(song: song)
        view.addSubview(harmonicaDetailsView)
        harmonicaDetailsView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
