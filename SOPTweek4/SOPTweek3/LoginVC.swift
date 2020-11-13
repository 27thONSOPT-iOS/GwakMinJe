//
//  LoginVC.swift
//  SOPTweek3
//
//  Created by 곽기곤's Mac on 2020/11/11.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func goToSignIn(_ sender: Any) {
        
        guard let signIn = self.storyboard?.instantiateViewController(identifier: "SigninVC") else {
            
            return
        }
        
        self.present(signIn, animated: true, completion: nil)
        signIn.modalPresentationStyle = .fullScreen
    }
    
    @IBAction func unwindVC1(segue: UIStoryboardSegue) {
        
        
    }
}
