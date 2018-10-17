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
    var headers = ["Category","Help & Support","Language"]
    
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
        return headers[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuTableViewCell
        cell.cellLabel.text = arr[indexPath.row]
        cell.backgroundColor = .black
        cell.cellLabel.textColor = .orange
        
        
        return cell
    }

}
