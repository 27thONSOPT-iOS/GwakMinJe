//
//  SignUpVC.swift
//  SOPTSeminar6
//
//  Created by 곽기곤's Mac on 2020/11/21.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {
/*
    "email": "dudgns4tp@naver.com",
    "password": "+4x9KTlP9sRwau8M/Czkiw2txbDKZJ+z0nEJf4GV18Sr/ePEMr7NYNz2d/h5dlqa2y1DSb7y2hdPJGQTFMwWOw==",
    "userName": "영훈"
 */
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func simpleAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        guard let emailText = emailTextField.text,

        let passwordText = passwordTextField.text,
        
        let userNameText = userNameTextField.text
              else {
        return
        }
        
        AuthService.shared.signUp(uEmail: emailText, uPassword: passwordText, userName: userNameText) { (networkResult) -> (Void) in

            switch networkResult {
            case .success(let uData):
                if let signUpData = uData as? DataClass {
                    
                    let uAlert = UIAlertController(title: "회원가입 성공!", message: "\(signUpData.userName)님 회원가입 성공!", preferredStyle: .alert)
                    
                    let uOkAction = UIAlertAction(title: "확인", style: .default) { (action) in
                        
                        let storyboard = UIStoryboard(name: "Login", bundle: nil)
                        if let destination = storyboard.instantiateViewController(identifier: "LoginVC") as? LoginVC {
                                
                            destination.modalPresentationStyle = .fullScreen
                            self.present(destination, animated: true
                                             , completion: nil)
                        }
                    }
                    uAlert.addAction(uOkAction)
                    
                    self.present(uAlert, animated: true, completion: nil)
                    
                    UserDefaults.standard.set(signUpData.userName, forKey: "signUpName")
            }
                
            case .requestErr(let uMsg):
                if let uMessage = uMsg as? String {
                    
                    self.simpleAlert(title: "회원가입 실패", message: uMessage)
                }
            case .pathErr:
                print("pathErr")
                
            case .serverErr:
                print("serverErr")
                
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
