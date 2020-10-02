//
//  MainSongListVC.swift
//  SocialHarmonica
//
//  Created by Batuhan Karababa on 27.09.2020.
//

import Foundation
import UIKit
import Firebase

class MainSongsListVC:UIViewController{
    
    //MARK: - Properties
    var authListenerHandle:AuthStateDidChangeListenerHandle?
    
    let reuseIdentifierSong = "SongCell"
    let tableView = UITableView()
    var songsList = [HarmonicaSong](){
        didSet{
            tableView.reloadData()
        }
    }
    
   
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustAuthListener()
        configureUI()
        getData()
    }

    //MARK: - Selectors


    //MARK: - DATA
    
    private func getData(){
        HarmonicaService.shared.getData { (songs) in
            self.songsList = songs
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Helpers
    
    private func adjustAuthListener(){
        authListenerHandle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil{
                let signUpController = SignUpVC()
                let navigationSignUp = UINavigationController(rootViewController: signUpController)
                navigationSignUp.modalPresentationStyle = .fullScreen
                self.present(navigationSignUp, animated: true, completion: nil)
            }
        })
    }
    
    private func configureUI(){
        view.backgroundColor = ColorConst.customBlue
        configureTableView()
    }
    
    private func configureTableView(){
        tableView.frame = view.frame
        tableView.rowHeight = 80
        tableView.register(SongCell.self, forCellReuseIdentifier: reuseIdentifierSong)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
}



extension MainSongsListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierSong) as? SongCell{
            cell.adjustUI(harmonicaSongVM: songsList[indexPath.row].createHarmonicaSongViewModel())
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = HarmonicaSongDetails()
        detailsVC.harmonicaSong = songsList[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}






//MARK: - Properties


//MARK: - Lifecycle


//MARK: - Selectors


//MARK: - Helpers


