//
//  ViewController.swift
//  SOPTweek1
//
//  Created by 곽기곤's Mac on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var partLbl: UILabel!
    @IBOutlet weak var greetingLbl: UILabel!
    
    var part: String?
    var greeting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main()
    }
    
    func main() {
        if let part = self.part,
           let greeting = self.greeting {
            self.partLbl.text = part
            self.greetingLbl.text = "\(greeting)님 안녕하세요"
        }
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
    }
}
