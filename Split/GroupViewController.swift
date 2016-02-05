//
//  GroupViewController.swift
//  Split
//
//  Created by David Mattia on 2/4/16.
//  Copyright © 2016 David Mattia. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    @IBOutlet weak var joinView: UIView!
    @IBOutlet weak var createView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = name!
        
        self.joinView.layer.cornerRadius = 20
        self.joinView.layer.masksToBounds = true
        
        self.createView.layer.cornerRadius = 20
        self.createView.layer.masksToBounds = true
    }
}
