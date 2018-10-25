////
////  testViewController.swift
////
////
////  Created by Tushar Singh on 25/10/18.
////
//
//import UIKit
//import SwipeMenuViewController
//class testViewController: UIViewController {
//
//
//    @IBOutlet weak var swipeMenuView: SwipeMenuView!
//    let array = ["s","d","a","w"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        swipeMenuView.delegate = self
//        swipeMenuView.dataSource = self
//        let options: SwipeMenuViewOptions = .init()
//
//
//    }
//
//
//
//}
//
//extension testViewController: SwipeMenuViewDelegate {
//
//    // MARK - SwipeMenuViewDelegate
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
//        // Codes
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
//        // Codes
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        // Codes
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        // Codes
//    }
//}
//
//extension testViewController: SwipeMenuViewDataSource {
//
//    //MARK - SwipeMenuViewDataSource
//    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
//        return array.count
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
//        return array[index]
//    }
//
//    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
//        let vc = ContentViewController()
//        return vc
//    }
//}
