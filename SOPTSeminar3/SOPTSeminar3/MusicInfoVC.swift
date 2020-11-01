//
//  MusicInfoVC.swift
//  SOPTSeminar3
//
//  Created by 곽기곤's Mac on 2020/10/31.
//

import UIKit

class MusicInfoVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var music: Music?

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    func setLayout() {
        
        if let music = self.music {
            
            titleLabel.text = music.title
            singerLabel.text = music.singer
            imageView.image = music.makeAlbumImage()
        }
    }
}
