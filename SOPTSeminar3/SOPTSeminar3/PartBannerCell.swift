//
//  PartBannerCell.swift
//  SOPTSeminar3
//
//  Created by 곽기곤's Mac on 2020/11/01.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    
    static let identifier = "PartBannerCell"
    
    @IBOutlet weak var partImageView: UIImageView!
    
    func setImage(imageName: String) {
        
        partImageView.image = UIImage(named: imageName)
    }
}
