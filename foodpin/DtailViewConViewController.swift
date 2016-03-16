//
//  DtailViewConViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/14.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit

class DtailViewConViewController: UIViewController {

    @IBOutlet weak var restaurantImgView: UIImageView!
    @IBOutlet weak var restaurantNameLebel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImgView.image = UIImage(named: restaurant.image)
        restaurantTypeLabel.text = String(restaurant.type)
        restaurantLocationLabel.text = String(restaurant.location)
        restaurantNameLebel.text = String(restaurant.name)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
