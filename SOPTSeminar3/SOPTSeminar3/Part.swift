//
//  Part.swift
//  SOPTSeminar3
//
//  Created by 곽기곤's Mac on 2020/10/31.
//

import UIKit

struct Part {
    
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        
        return UIImage(named: imageName)
    }
}
