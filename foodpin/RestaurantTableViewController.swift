//
//  RestaurantTableViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/7.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit
import CoreData

class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var Restaurants: [Restaurant] = []
    var frc: NSFetchedResultsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let request = NSFetchRequest(entityName: "Restaurant")
        
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer, sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        do {
            try frc.performFetch()
            Restaurants = frc.fetchedObjects as! [Restaurant]
        } catch {
            print(error)
        
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Automatic)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        default:
            tableView.reloadData()
        }
        Restaurants = controller.fetchedObjects as! [Restaurant]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Restaurants.count
    }
        //选择了行之后的操作
/*    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "选择", message: "亲，你点了我", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let okAction = UIAlertAction(title: "爹知道了", style: UIAlertActionStyle.Cancel) { (_) -> Void in
            print("爹爹点了")
        }
        
        let dailActionRun = {(action: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您拨打的电话无人接听", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let dialAction = UIAlertAction(title: "拨打 021-333\(indexPath.row)", style: UIAlertActionStyle.Default, handler: dailActionRun)
        
        let like = UIAlertAction(title: "LIKE", style: .Default) { (_) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            self.check[indexPath.row] = true
        }
        alert.addAction(okAction)
        alert.addAction(dialAction)
        alert.addAction(like)
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as!CustomTableViewCell

        // Configure the cell...
        cell.restaurantName.text = Restaurants[indexPath.row].name
        cell.restaurantImg.image = UIImage(data: Restaurants[indexPath.row].image!)
        cell.restaurantImg.layer.cornerRadius = 30
        cell.restaurantImg.clipsToBounds = true
        cell.restaurantLocation.text = Restaurants[indexPath.row].location
        cell.restaurantType.text = Restaurants[indexPath.row].type
 //       cell.favImg.image = UIImage(named: "heart")
 //       cell.favImg.hidden = true
        if Restaurants[indexPath.row].isVisited == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            Restaurants.removeAtIndex(indexPath.row)
//            
//            
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    let Share = UITableViewRowAction(style: .Default, title: "分享") { (action, NSIndexPath) -> Void in
            
            let alert = UIAlertController(title: "分享到", message: "哪个社交网络", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let weChatAction = UIAlertAction(title: "微信", style: UIAlertActionStyle.Default, handler: nil)
            let qqChatAction = UIAlertAction(title: "腾讯", style: UIAlertActionStyle.Default, handler: nil)
            let wbChatAction = UIAlertAction(title: "微博", style: UIAlertActionStyle.Default, handler: nil)
            
            alert.addAction(weChatAction)
            alert.addAction(qqChatAction)
            alert.addAction(wbChatAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    let Delete = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "删除") { (action, NSIndexPath) -> Void in
        
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        let restaurantToDel = self.frc.objectAtIndexPath(indexPath) as! Restaurant
        
        buffer?.deleteObject(restaurantToDel)
        
        do {
            try buffer?.save()
        } catch{
            print(error)
        }
    
        }
        Share.backgroundColor = UIColor(red: 218/255, green: 225/255, blue: 218/255, alpha: 1)
        return [Share,Delete]
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail"{
            let destVC = segue.destinationViewController as! DetailTableViewController
            destVC.restaurant = Restaurants[(tableView.indexPathForSelectedRow!.row)]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    @IBAction func cancel(segue: UIStoryboardSegue){
        
    }
    

}
