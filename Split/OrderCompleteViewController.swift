//
//  OrderCompleteViewController.swift
//  Split
//
//  Created by David Mattia on 2/4/16.
//  Copyright © 2016 David Mattia. All rights reserved.
//

import UIKit

class OrderCompleteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    var users = [("You", true),
        ("Tom", false),
        ("John", false),
        ("Megan", false),
        ("Sarah", false)]
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        
        self.progressView.progress = Float(1.0 / Double(users.count))
    }
    
    override func viewDidAppear(animated: Bool) {
        self.userTableView.reloadData()
        
        self.timer = NSTimer(timeInterval: 0.6, target: self, selector: "addCheck", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes)
    }
    
    func addCheck() {
        // Randomly pick one of the five users.
        // Check that user if they are not already checked
        // Check if the order is complete
        let index = random() % self.users.count
        if(!users[index].1) {
            // user is not checked
            self.progressView.progress += Float(1.0 / Double(users.count))
            users[index].1 = true
            self.userTableView.reloadData()
            if self.isComplete() {
                self.timer?.invalidate()
                self.headerLabel.backgroundColor = UIColor.greenColor()
                self.headerLabel.text = "Complete!"
                let alert = UIAlertController(title: "Order Complete",
                    message: "Your group's order is now complete",
                    preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                    UIAlertAction in
                    self.performSegueWithIdentifier("restartSegue", sender: self)
                }
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func isComplete() -> Bool {
        for user in users {
            if !user.1 {
                return false
            }
        }
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("orderCell") as! OrderCompleteCell
        
        cell.selectionStyle = .None
        cell.usernameLabel.text = users[indexPath.row].0
        cell.checkbox.isChecked = users[indexPath.row].1
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
}
