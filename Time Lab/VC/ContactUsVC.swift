//
//  ContactUsVC.swift
//  Time Lab
//
//  Created by Tushar Singh on 19/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit

class ContactUsVC: UIViewController {


    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenue()
    }

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
    
}
