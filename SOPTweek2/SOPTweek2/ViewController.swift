//
//  ViewController.swift
//  SOPTweek2
//
//  Created by 곽기곤's Mac on 2020/10/18.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var entireView: UIView!
    @IBOutlet weak var scrollToTopButton: UIButton!
    @IBOutlet weak var scrollToTopView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myScrollView.delegate = self
        
        scrollToTopButton.isHidden = true
        scrollToTopButton.backgroundColor = .white
        scrollToTopButton.tintColor = .black
        scrollToTopButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        scrollToTopButton.layer.cornerRadius = 25
        scrollToTopButton.layer.borderWidth = 2
                
        entireView.bringSubviewToFront(scrollToTopView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (myScrollView.contentOffset.y > (myScrollView.contentSize.height - myScrollView.frame.size.height) / 2) {
            
            scrollToTopButton.isHidden = false
        } else {
            
            scrollToTopButton.isHidden = true
        }
    }
    
    @IBAction func scrollToTopButton(_ sender: Any) {
        
        myScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
