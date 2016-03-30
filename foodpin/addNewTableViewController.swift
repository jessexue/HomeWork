//
//  addNewTableViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/17.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit
import CoreData

class addNewTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var restaurant: Restaurant!
    var isVisited = false
    @IBAction func saveBtTapped(sender: UIBarButtonItem) {
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext

        NSEntityDescription.inse
    }
    @IBOutlet weak var picImgView: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var type: UITextField!

    @IBOutlet weak var labelVisited: UILabel!
    @IBAction func isVisited(sender: UIButton) {
        
        if sender.tag == 101 {
            isVisited = true
            labelVisited.text = "我来过"
        }else{
            isVisited = false
            labelVisited.text = "没来过"
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: { () -> Void in
                    
                })
            }
            
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picImgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picImgView.contentMode = .ScaleAspectFill
        picImgView.clipsToBounds = true
        
        let leftcons = NSLayoutConstraint(item: picImgView, attribute: .Leading, relatedBy: .Equal, toItem: picImgView.superview, attribute: .Leading, multiplier: 1, constant: 0)
        let rightcons = NSLayoutConstraint(item: picImgView, attribute: .Trailing, relatedBy: .Equal, toItem: picImgView.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        let topcons = NSLayoutConstraint(item: picImgView, attribute: .Top, relatedBy: .Equal, toItem: picImgView.superview, attribute: .Top, multiplier: 1, constant: 0)
        let bottomcons  =   NSLayoutConstraint(item: picImgView, attribute: .Bottom, relatedBy: .Equal, toItem: picImgView.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        
        leftcons.active = true
        rightcons.active = true
        topcons.active = true
        bottomcons.active = true
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
