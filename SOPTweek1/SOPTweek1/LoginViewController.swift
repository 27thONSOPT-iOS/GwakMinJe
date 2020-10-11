//
//  LoginViewController.swift
//  SOPTweek1
//
//  Created by 곽기곤's Mac on 2020/10/11.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logPart: UITextField!
    @IBOutlet weak var logName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let toMain = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {
            return
        }
        
        toMain.part = self.logPart.text
        toMain.greeting = self.logName.text
        
        toMain.modalPresentationStyle = .fullScreen
        present(toMain, animated: true, completion: nil)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        guard let toSignUp = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(toSignUp, animated: true)
    }
}
