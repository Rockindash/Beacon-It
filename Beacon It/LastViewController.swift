//
//  LastViewController.swift
//  Beacon It
//
//  Created by amol kumar on 12/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit
import CoreLocation

class LastViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txt: UITextView!
    var window: UIWindow?
    var location: CLLocation!

    
    let locationManager = CLLocationManager()
    var region = CLCircularRegion()
    
    //Beacon
    let regionBeacon = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Beacon")
    var enteredRegion = true
    var x=0

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //Requesting permission for location and setting
        locationManager.delegate=self
        locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        
        //Geofencing
        //Lotus Temple
        var coordinate1 = CLLocationCoordinate2DMake(28.553511, 77.258858)
        region = CLCircularRegion(center: (coordinate1), radius: 100, identifier: "Hello")
        locationManager.startMonitoringForRegion(region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didStartMonitoringForRegion region: CLRegion) {
        print("Monitoring")
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //Entering Region
        print("Enter")
        
        
        txt.text="The Lotus Temple, located in New Delhi, India, is a Bahá'í House of Worship completed in 1986. Notable for its flowerlike shape, it serves as the Mother Temple of the Indian subcontinent and has become a prominent attraction in the city. The Lotus Temple has won numerous architectural awards and been featured in hundreds of newspaper and magazine articles.[1] Like all Bahá'í Houses of Worship, the Lotus Temple is open to all, regardless of religion or any other qualification. The building is composed of 27 free-standing marble-clad petals arranged in clusters of three to form nine sides,[2][not in citation given] with nine doors opening onto a central hall with height of slightly over 40 metres[3] and a capacity of 2,500 people. A 2001 CNN report referred to it as the most visited building in the world.\nType House of Worship\nArchitectural style    Expressionist\nLocation    New Delhi, India\nCoordinates    28.553325°N 77.258600°ECoordinates: 28.553325°N 77.258600°E\nCompleted    13 November 1986\nOpened    24 December 1986\nHeight    34.27 metres (112.4 ft)\nDimensions\nDiameter    70 metres (230 ft)\nTechnical details\nStructural system    Concrete frame and precast concrete ribbed roof\nDesign and construction\nArchitect    Fariborz Sahba\nStructural engineer    Flint & Neill\nOther information\nSeating capacity    1,300"

        img.image=UIImage(named: "top")
        
        
        if(x==2){
            // Beacon API HIT
            enteredRegion=true
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
            notification.alertBody = "Enter Beacon"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }else{
            // Geofence API Hit
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
            notification.alertTitle = "Welcome to Beacon monitored Area"
            notification.alertBody = "Please enable Bluetooth to access futher features"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        //Exit Region
        print("Exit")
        
        if(x==2){
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
            notification.alertBody="Exit Beacon"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }else{
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
            notification.alertTitle="Thanks for the visit"
            notification.alertBody="Hope to see you again"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)}
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status{
            
        case .AuthorizedAlways:
            
            locationManager.startMonitoringForRegion(regionBeacon)
            locationManager.startRangingBeaconsInRegion(regionBeacon)
            locationManager.requestStateForRegion(regionBeacon)
            
        case .Denied:
            
            let alert = UIAlertController(title: "Warning", message: "You've disabled location update which is required for this app to work. Go to your phone settings and change the permissions.", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
            alert.addAction(alertAction)
            
            self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
            
        default:
            print("default case")
            
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
        if(beacons.isEmpty==false){
            x=2
        }else{
            x=0
            
        }
        let knownBeacons=beacons.filter{ $0.proximity != CLProximity.Unknown}
        if(knownBeacons.count > 0){
            let closestBeacon = knownBeacons[0] as CLBeacon
            
            
            
            //Conditions for different beacon
            if(closestBeacon.minor==1093&&closestBeacon.major==34083){
                
                
                
            }
            else{
                
                
                
            }
        }

    

}
}