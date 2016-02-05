//
//  menuViewController.swift
//  Split
//
//  Created by David Mattia on 2/4/16.
//  Copyright © 2016 David Mattia. All rights reserved.
//

import UIKit

class menuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items = [("Chicken Fingers", 8.50),
        ("Salad", 6.00),
        ("Butterbeer", 3.50),
        ("Chocolate Frog", 4.00),
        ("Milk", 1.50)]
    
    var cart = [Int]()
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("menuItemCell") as? menuCell {
            cell.selectionStyle = .None
            cell.itemNameLabel.text = items[indexPath.row].0
            let cost = items[indexPath.row].1
            cell.costLabel.text = String(format: "$%.2f", arguments: [cost])
            return cell
        }
        return UITableViewCell()
    }
    
    func updateCart() {
        var sum = 0.0
        for item in self.cart {
            sum += self.items[item].1
        }
        let dollarString = String(format: "$%.2f", arguments: [sum])
        self.sumLabel.text = dollarString
    }
    
    @IBAction func switchSwitched(sender: AnyObject) {
        let button = sender as! UISwitch
        let view = button.superview!
        let cell = view.superview as! menuCell
        
        let indexPath = self.menuTableView.indexPathForCell(cell)
        if let row = indexPath?.row {
            if let index = self.cart.indexOf(row) {
                self.cart.removeAtIndex(index)
            } else {
                self.cart.append(row)
            }
            self.updateCart()
        }
    }
}
