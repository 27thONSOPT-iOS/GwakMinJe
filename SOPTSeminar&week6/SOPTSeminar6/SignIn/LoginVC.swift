//
//  LoginVC.swift
//  SOPTSeminar6
//
//  Created by 곽기곤's Mac on 2020/11/21.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func simpleAlert(title: String, message: String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
    
    present(alert, animated: true)
}
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text else {
            
            return
        }
        
        AuthService.shared.signIn(email: emailText, password: passwordText) { (networkResult) in
            
            switch networkResult {
            case .success(let data):
                if let data = data as? SigninData {
                    
                    self.simpleAlert(title: "로그인", message: "\(data.userName)님 안녕하세요.")
                    
                    UserDefaults.standard.setValue(data.userName, forKey: "userName")
                }
                print("success")
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    
                    self.simpleAlert(title: "로그인 실패", message: message)
                }
                
                print("requestErr")
                
            case .pathErr:
                print("pathErr")
                
            case .serverErr:
                print("serverErr")
                
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    @IBAction func goToSignUp(_ sender: Any) {
        
        let signUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        
        if let dvc = signUpStoryboard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC {
            
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true
                         , completion: nil)
        }
    }
}
