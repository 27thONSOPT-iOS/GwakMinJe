//
//  TableViewTestVC.swift
//  SOPTSeminar3
//
//  Created by 곽기곤's Mac on 2020/10/31.
//

import UIKit

class TableViewTestVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var musicRank: [Music] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return musicRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicRankCell.identifier) as? MusicRankCell else {
            
            return UITableViewCell()
        }
        
        cell.setCell(rank: indexPath.row, music: musicRank[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectMusic = musicRank[indexPath.row]
        let storyboard = UIStoryboard(name: "MusicInfo", bundle: nil)
        if let destination = storyboard.instantiateViewController(identifier: "MusicInfoVC") as? MusicInfoVC {
            
            destination.music = selectMusic
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    

    @IBOutlet weak var musicRankTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setMusicData()
        
        musicRankTableView.delegate = self
        musicRankTableView.dataSource = self
    }
    
    func setMusicData() {
        
        musicRank.append(contentsOf: [
            Music(title: "Lovesick Girls", singer: "Black Pink", albumImageName: "blackpink"),
            Music(title: "Dynamite", singer: "방탄소년단", albumImageName: "bts"),
            Music(title: "Positions", singer: "Ariana Grande", albumImageName: "ariana"),
            Music(title: "놓아줘 (with 태연)", singer: "크러쉬", albumImageName: "crush"),
            Music(title: "I Can't Stop Me", singer: "Twice", albumImageName: "twice")
        ])
    }
}
