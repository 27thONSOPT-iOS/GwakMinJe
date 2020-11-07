//
//  CustomTabBarContorller.swift
//  SOPTSeminar4
//
//  Created by 곽기곤's Mac on 2020/11/07.
//

import UIKit

class CustomTabBarContorller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabs()
    }
    
    func setTabs() {
    
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") as? GreenVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC else {
            return
        }
        
        greenVC.tabBarItem.image = UIImage(systemName: "house")
        greenVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        greenVC.tabBarItem.title = "Home"
        
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        blueVC.tabBarItem.title = "profile"
        
        setViewControllers([greenVC, blueVC], animated: true)
    }
    
    
}
