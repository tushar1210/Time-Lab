//
//  SideMenuTableVCTableViewController.swift
//  Time Lab
//
//  Created by Tushar Singh on 16/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit

class SideMenuTableVCTableViewController: UITableViewController {
    var arr = ["1","2","3"]
    var headers = ["Categories","Help & Support","Language"]
    var data = [["watch1","watch2","watch3"],["Post Ad","About Us","Contact Us","Terms & Conditions"],["English","Arabic"]]
    //var data = ["Categories":["watch1","watch2","watch3"]]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 40
        tableView.reloadData()
       // tableView.sectionIndexBackgroundColor = .orange
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("\n\nheader called")
        return headers[section]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = .orange
        
        let headerLabel = UILabel(frame: CGRect(x: 5, y: 10, width: tableView.bounds.size.width, height: 20))
        headerLabel.text = headers[section]
        headerLabel.textColor = .black
        headerView.addSubview(headerLabel)
        
        return headerView
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\n\ncell called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuTableViewCell
        cell.cellLabel.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .black
        cell.cellLabel.textColor = .orange
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let val = data[indexPath.section][indexPath.row]
        tableView.allowsMultipleSelection=false
        
        switch val{
            case "About Us" : performSegue(withIdentifier: "aboutus", sender: nil);break;
            case "Terms & Conditions" : performSegue(withIdentifier: "terms", sender: nil);break;
            case "Contact Us" : performSegue(withIdentifier: "contactus", sender: nil);break;
            case "Post Ad" : performSegue(withIdentifier: "postad", sender: nil);break;
            default : break;
        }
    }
    
    
}
