//
//  ModelCollectionViewCell.swift
//  SOPTweek3
//
//  Created by 곽기곤's Mac on 2020/11/03.
//

import UIKit

class ModelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personMessage: UILabel!
    
    func setProfile(image: String, name: String, message: String) {
        
        self.personImage.image = UIImage(named: image)
        self.personName.text = name
        self.personMessage.text = message
    }
}
