//
//  AboutUsVC.swift
//  Time Lab
//
//  Created by Tushar Singh on 19/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        getSize()
        sideMenue()
        
    }
    @IBOutlet weak var scrollViewWidth: NSLayoutConstraint!
    func sideMenue(){
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }
    
    @IBAction func homeButton(_ sender: Any) {
        let home:UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "root"))!
        self.present(home, animated: true, completion: nil)
    }
    
    func getSize() {
        let size = content.text!.getheight(withConstrainedWidth: scrollViewWidth.constant, font: content.font)
        scrollViewHeightConstraint.constant = size*2.5
    }
}


extension String {
    func getheight(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
