//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Chieh-Chun Li on 2015/12/8.
//  Copyright © 2015年 Dan.Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var theTableView: UITableView!
    var currentArray : [[String]]!
    var array : [[String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theTableView.delegate = self
        theTableView.dataSource = self
        array = [["sub","sub","sub"],["sub","sub"]]
        currentArray = [[""],[""]]
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return currentArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArray[section].count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellID : String?
        var cell : UITableViewCell?
        if indexPath.row == 0
        {
            cellID = "main"
        }
        else
        {
            cellID = "sub"
        }
        
        cell = tableView.dequeueReusableCellWithIdentifier(cellID!)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0
        {
            if currentArray[indexPath.section] == [""]
            {
                currentArray[indexPath.section] = array[indexPath.section]
            }
            else
            {
                currentArray[indexPath.section] = [""]
            }
            
            tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

