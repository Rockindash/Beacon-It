//
//  AppDelegate.swift
//  GeoBeacon
//
//  Created by amol kumar on 02/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    var vc = ViewController()
   
    let locationManager = CLLocationManager()
    var region = CLCircularRegion()
    var enteredRegion = true
    var x=0
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Registering Notification
        let settings = UIUserNotificationSettings(forTypes: [.Badge , .Alert ,.Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
        //Requesting permission for location and setting
        locationManager.delegate=self
        locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        
        //Geofencing
        var coordinate1 = CLLocationCoordinate2DMake(28.553511, 77.258858)
        region = CLCircularRegion(center: (coordinate1), radius: 100, identifier: "Hello")
        locationManager.startMonitoringForRegion(region)
        
        //Beacon
        
        
        return true
    }
    
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didStartMonitoringForRegion region: CLRegion) {
        print("Monitoring")
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //Entering Region
        print("Enter")
        
            // Geofence API Hit
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
        notification.alertTitle="Welcome to beacon enabled zone"
        
        notification.alertBody="Please turn on Bluetooth for more features"
        
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        //Exit Region
        print("Exit")
        
            var notification:UILocalNotification=UILocalNotification()
            var dateTime = NSDate()
            notification.fireDate=dateTime
        
        notification.alertTitle = "Thanks for the visit"
        notification.alertBody = "Hope to see you again"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
    }
    
    
    
   
    
    
    func applicationWillResignActive(application: UIApplication) {
        
        
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
        
        
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        
        
        
    }
    
    
}