//
//  ViewController.swift
//  Memepedia
//
//  Created by apcsp on 9/21/16.
//  Copyright © 2016 apcsp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource
 {
    var memeArray = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return memeArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = "Meme Test"
                return cell
        
    }


}

