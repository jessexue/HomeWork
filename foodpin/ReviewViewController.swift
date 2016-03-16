//
//  ReviewViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/16.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating: String?
    
    @IBOutlet weak var ratingBT1: UIView!
    @IBOutlet weak var reviewBT2: UIView!
    @IBOutlet weak var reviewBT3: UIView!
    @IBOutlet weak var BGimg: UIImageView!
    @IBAction func rT1(sender: UIButton) {
        
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 2:
            rating = "good"
        case 3:
            rating = "great"
        default: break
        
        }
        performSegueWithIdentifier("unwindToDetail", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blur = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.frame = view.frame
        
        BGimg.addSubview(effectView)
        
        
        ratingBT1.transform = CGAffineTransformMakeScale(0, 0)
        reviewBT2.transform = CGAffineTransformMakeScale(0, 0)
        reviewBT3.transform = CGAffineTransformMakeScale(0, 0)
        
        
        
    }

        // Do any additional setup after loading the view.
    
    
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.3) { () -> Void in
//            self.ratingBT1.transform = CGAffineTransformIdentity
//            self.reviewBT2.transform = CGAffineTransformIdentity
//            self.reviewBT3.transform = CGAffineTransformIdentity
//        }
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            self.ratingBT1.transform = CGAffineTransformIdentity


            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            self.reviewBT2.transform = CGAffineTransformIdentity

            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            self.reviewBT3.transform = CGAffineTransformIdentity
            
            }, completion: nil)
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
