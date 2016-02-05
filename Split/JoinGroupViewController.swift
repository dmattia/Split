//
//  JoinGroupViewController.swift
//  Split
//
//  Created by David Mattia on 2/4/16.
//  Copyright © 2016 David Mattia. All rights reserved.
//

import UIKit

class JoinGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let groups = ["Stanford Hall 1 East/West",
                "South Bend Code School",
                "Basketball Team",
                "Three Muskateers",
                "Peverell Brothers"]
    
    @IBOutlet weak var groupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.groupTableView.delegate = self
        self.groupTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groupCell") as! GroupCell
        
        cell.nameLabel.text = groups[indexPath.row]
        
        return cell
    }
}
