//
//  RestaurantViewController.swift
//  Split
//
//  Created by David Mattia on 2/4/16.
//  Copyright © 2016 David Mattia. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var restaurantTableView: UITableView!
    
    let logos = ["abp", "barbici", "burgerking", "mark", "chipotle"]
    let names = ["Au bon pain", "Barbici", "Burger King", "The Mark", "Chipotle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restaurantTableView.delegate = self
        self.restaurantTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell") as? restaurantCell {
            if let image = UIImage(named: logos[indexPath.row]) {
                cell.pictureView.image = image
            }
            cell.nameLabel.text = names[indexPath.row]

            return cell
        }
        return restaurantCell()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? GroupViewController {
            let indexPath = self.restaurantTableView.indexPathForSelectedRow
            destinationVC.name = names[indexPath!.row]
        }
    }
}
