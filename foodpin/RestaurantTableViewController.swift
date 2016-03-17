//
//  RestaurantTableViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/7.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var Restaurants = [Restaurant(name: "咖啡胡同", type: "咖啡 & 茶店", location: "香港上环德辅道西78号G/F", image: "cafedeadend.jpg", isVisted: false) ,
        Restaurant(name: "霍米", type: "咖啡", location: "香港上环文咸东街太平山22-24A，B店", image: "homei.jpg", isVisted: false) ,
        Restaurant(name: "茶.家", type: "茶屋", location: "香港葵涌和宜合道熟食市场地下", image: "teakha.jpg", isVisted: false) ,
        Restaurant(name: "洛伊斯咖啡", type: "奥地利式 & 休闲饮料", location: "香港新界葵涌屏富径", image: "cafeloisl.jpg", isVisted: false) ,
        Restaurant(name: "贝蒂生蚝", type: "法式", location: "香港九龙尖沙咀河内道18号(近港铁尖东站N3,N4出口) ", image: "petiteoyster.jpg", isVisted: false) ,
        Restaurant(name: "福奇餐馆", type: "面包房", location: "香港岛中环都爹利街13号乐成行地库中层", image: "forkeerestaurant.jpg", isVisted: false) ,
        Restaurant(name: "阿波画室", type: "面包房", location: "香港岛铜锣湾轩尼诗道555号崇光百货地库2楼30号铺", image: "posatelier.jpg", isVisted: false) ,
        Restaurant(name: "伯克街面包坊", type: "巧克力", location: "4 Hickson Rd、The Rocks NSW 2000", image: "bourkestreetbakery.jpg", isVisted: false) ,
        Restaurant(name: "黑氏巧克力", type: "咖啡", location: "31 Wheat Rd、Sydney NSW 2001", image: "haighschocolate.jpg", isVisted: false) ,
        Restaurant(name: "惠灵顿雪梨", type: "美式 & 海鲜", location: "1/11-31 York Street Sydney NSW Australia、Sydney NSW 2000", image: "palominoespresso.jpg", isVisted: false) ,
        Restaurant(name: "北州", type: "美式", location: "Macy's、151 W 34th St Fifth Floor、New York, NY 10001", image: "upstate.jpg", isVisted: false) ,
        Restaurant(name: "布鲁克林塔菲", type: "美式", location: "250 8th Ave、New York, NY 10107", image: "traif.jpg", isVisted: false) ,
        Restaurant(name: "格雷厄姆大街肉", type: "早餐 & 早午餐", location: "55-1 Riverwalk Pl、West New York, NJ 07093", image: "grahamavenuemeats.jpg", isVisted: false) ,
        Restaurant(name: "华夫饼 & 沃夫", type: "法式 & 茶", location: "1585 Broadway、New York, NY 10036-8200", image: "wafflewolf.jpg", isVisted: false) ,
        Restaurant(name: "五叶", type: "咖啡 & 茶", location: "1460 Broadway、New York, NY 10036", image: "fiveleaves.jpg", isVisted: false) ,
        Restaurant(name: "眼光咖啡", type: "拉丁美式", location: "250 8th Ave、New York, NY 10107", image: "cafelore.jpg", isVisted: false) ,
        Restaurant(name: "忏悔", type: "西班牙式", location: "822 Lexington Ave、New York, NY 10065", image: "confessional.jpg", isVisted: false) ,
        Restaurant(name: "巴拉菲娜", type: "西班牙式", location: "Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA", image: "barrafina.jpg", isVisted: false) ,
        Restaurant(name: "多尼西亚", type: "西班牙式", location: "Waterloo Station、London SE1 7LY", image: "donostia.jpg", isVisted: false) ,
        Restaurant(name: "皇家橡树", type: "英式", location: "Unit 4a、44-58 Brompton Rd、London SW3 1BW", image: "royaloak.jpg", isVisted: false) ,
        Restaurant(name: "泰咖啡", type: "泰式", location: "7-9 Golders Green Rd、London NW11 8DY", image: "thaicafe.jpg", isVisted: false)
]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

        

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
        cell.restaurantImg.image = UIImage(named: Restaurants[indexPath.row].image)
//        cell.restaurantImg.layer.cornerRadius = cell.restaurantImg.frame.size.width / 2
        cell.restaurantImg.clipsToBounds = true
        cell.restaurantLocation.text = Restaurants[indexPath.row].location
        cell.restaurantType.text = Restaurants[indexPath.row].type
 //       cell.favImg.image = UIImage(named: "heart")
 //       cell.favImg.hidden = true
        if Restaurants[indexPath.row].isVisted == true {
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
        
        self.Restaurants.removeAtIndex(indexPath.row)
        
        print(self.Restaurants.count)
        
        // Delete the row from the data source
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    
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
