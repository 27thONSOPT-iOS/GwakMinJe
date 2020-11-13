//
//  SigninVC.swift
//  SOPTweek3
//
//  Created by 곽기곤's Mac on 2020/11/11.
//

import UIKit

class SigninVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {

         self.view.frame.origin.y = -200
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {

        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)
    }

    @IBAction func unwind(_ sender: Any) {
        
        performSegue(withIdentifier: "unwindVC1", sender: self)
    }
    
}
