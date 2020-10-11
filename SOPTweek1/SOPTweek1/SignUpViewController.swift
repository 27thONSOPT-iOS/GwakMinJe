//
//  SignUpViewController.swift
//  SOPTweek1
//
//  Created by 곽기곤's Mac on 2020/10/11.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func toLoginBtn(_ sender: Any) {
     
        self.navigationController?.popViewController(animated: true)
    }
}
