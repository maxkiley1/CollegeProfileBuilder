//
//  ViewController.swift
//  Map Search
//
//  Created by maxkiley on 2/17/16.
//  Copyright © 2016 maxkiley. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myMapView: MKMapView!
    
    var college2: College!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(college2.name)
        geoCodeLocation(college2.name)
        myTextField.text = college2.name
    
    }
    //searches for textfield text
    @IBAction func searchButtonTapped(sender: AnyObject)
    {
        geoCodeLocation(myTextField.text!)
        myTextField.resignFirstResponder()
    }
    
    //CLPlacemark represnets placemark data for a geographic location.
    func displayMap(MyPlaceMark: CLPlacemark)
    {
        let myLocation = MyPlaceMark
        let mySpan = MKCoordinateSpanMake(0.05, 0.05)
        let myRegion = MKCoordinateRegionMake((myLocation.location?.coordinate)!, mySpan)
        
        
        myMapView.setRegion(myRegion, animated: true)
        let myPin = MKPointAnnotation()
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlaceMark.name
        
        myMapView.addAnnotation(myPin)
        myTextField.text = MyPlaceMark.name
    }
    
    func geoCodeLocation(mySearch: String)
    {
        // CLGeocoder rpovides service for converting between a coordinate and a user friendly representation of that coordinate
        let myGeoCode = CLGeocoder()
        
        myGeoCode.geocodeAddressString(mySearch) { (placemarks, error) -> Void in
            if error != nil
            {
                print("Error")
            }
            else
            {
                self.displayMap(placemarks!.first!)
            }
        }
    }
    
}

