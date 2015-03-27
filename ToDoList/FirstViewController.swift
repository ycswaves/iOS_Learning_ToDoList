//
//  FirstViewController.swift
//  ToDoList
//
//  Created by YCS on 27/3/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var todoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell?.textLabel?.text = toDoList[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete { //swipe left
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList") //update permanent storage
            todoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        todoListTable.reloadData()
    }
}

