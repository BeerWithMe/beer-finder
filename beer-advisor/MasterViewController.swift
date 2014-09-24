//
//  MasterViewController.swift
//  masterTest
//
//  Created by Samuel Nelson on 9/22/14.
//  Copyright (c) 2014 design-code. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var recommendationData = Recommendations()
    
    
    var objects = NSMutableArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateView() {
        println("POPULATE VIEW!!!!")
        var recommendationData = Recommendations()
        var recommendationList = recommendationData.recommendationList
        for (var i = 0; i < recommendationList.count; i++) {
            println("it ran!!!")
            objects.insertObject(recommendationList[i]["name"]!!, atIndex: i)
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        println("POPULATE VIEW END")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        println("VIEW DID LOAD")
        self.populateView()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(sender: AnyObject) {
        //recommendationData.downloadData()
        let recommendationList = recommendationData.recommendationList
        println(recommendationList[0]["name"]!!)
        objects.insertObject(recommendationList[0]["name"]!!, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object: AnyObject = objects[indexPath.row]
                (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let object: AnyObject = objects[indexPath.row]
        cell.textLabel?.text = object.description
        //cell.textLabel?.text = "Hey guys!"

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    

    
}