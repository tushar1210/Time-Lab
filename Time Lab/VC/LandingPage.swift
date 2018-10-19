//
//  ViewController.swift
//  Time Lab
//
//  Created by Tushar Singh on 15/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import ImageSlideshow

class LandingPage: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var collectioView: UICollectionView!
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    var watchArray = ["watch1","watch2","watch3","watch4"]
    var slideshowArray = ["watch","watch","watch","watch","watch"]
    var stateArray = ["Sold","Available","Sold","Sold"]
    let tncLabel = ["Categories","Help & Support","Languages"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.delegate = self
        collectioView.dataSource = self
        sideMenue()
        collectioView.reloadData()
        slideshow.setImageInputs([
            ImageSource(image: (((UIImage(named: "watch")) ?? nil) ?? nil)!),
            ImageSource(image: (((UIImage(named: "watch1")) ?? nil) ?? nil)!),
            ImageSource(image: (((UIImage(named: "watch2")) ?? nil) ?? nil)!),
            ImageSource(image: (((UIImage(named: "watch3")) ?? nil) ?? nil)!)])
        slideshow.slideshowInterval = 2.0
        slideshow.pageIndicator = nil
        addNavBarImage()
   
}
    
    func sideMenue(){
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }
    func addNavBarImage() {

        let navController = navigationController!

        let image = UIImage(named: "watch4")
        let imageView = UIImageView(image: image)

        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height

        let bannerX = (bannerWidth / 2 - (image?.size.width)! / 2)-20
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
    }
}


extension LandingPage: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath) as! CollectionViewCell
        cell.descriptionLabel.text = watchArray[indexPath.row]
        cell.statusLabel.text = stateArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 0.48*collectionView.frame.width, height: 280)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // print("\n\n\n",indexPath.row)
        collectioView.reloadData()
        var state : Bool = false
        if stateArray[indexPath.row] == "Sold"{
            state = false
            print(indexPath.row,state)
        }
        else{
            state = true
            performSegue(withIdentifier: "detailitem", sender: nil)
        }
    }
}


