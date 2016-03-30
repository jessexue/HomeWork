//
//  MapViewController.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/16.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant: Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        
//地址转换
    let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                
                }
                
            }
        }
        
        // Do any additional setup after loading the view.
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "myLocation"
        
        if annotation is MKUserLocation{
            return nil
        }
        
        var annotationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        if annotationView == nil{
        
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.canShowCallout = true
        }
        
        let imagView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        imagView.image = UIImage(data: restaurant.image!)
        annotationView?.leftCalloutAccessoryView = imagView
        return annotationView
        
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
