//
//  MessageView.swift
//  Parking
//
//  Created by Flatiron School on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit

class MessageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /* I am going to put in the rest of the labels and 
     2 subviews 
    */
    
    @IBOutlet weak var tableView: UITableView!
    
    var parkingLocations = ["junk1","junk2","more Junk!!!","awesome Junk!"] //some arbitrary things to put in here for testing
    var testHeaders = ["coolShit1", "coolShit2", "coolShit3"]
//    let reuseIdentifier = "myNib"
    let reuseIdentifier = "cell"
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navBar.barTintColor = UIColor(red: 8/255.0, green: 91/255.0, blue: 133/255.0, alpha: 1.0)
        navBar.tintColor = UIColor(red: 8/255.0, green: 91/255.0, blue: 133/255.0, alpha: 1.0)

        
        
        // Register custom cell
//        let nib = UINib(nibName: "LocationCell", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return testHeaders.count
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingLocations.count
    }


     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
//        let cell: TblCell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! TblCell
        let cell: MyCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! MyCell
        cell.nameLabel.text! = "Nice"
        cell.fromLabel.text! = "Place1"
        cell.toLabel.text! = "Place2"
//        cell.label.text = parkingLocations[indexPath.row]
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(red: 233/255.0, green: 230/255.0, blue: 235/255.0, alpha: 1.0).CGColor

        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return testHeaders[section]
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0 as CGFloat
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
