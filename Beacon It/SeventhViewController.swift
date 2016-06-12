//
//  SeventhViewController.swift
//  Beacon It
//
//  Created by amol kumar on 12/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SeventhViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var Map: MKMapView!
    let locationManager = CLLocationManager()
    var location: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate=self
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.Map.showsUserLocation=true


        let location = CLLocationCoordinate2DMake(28.555586, 77.264226)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Delhi Haat"
        annotation.subtitle = "Museum"
        Map.addAnnotation(annotation)
        
        //Span
//        var span = MKCoordinateSpanMake(0.002, 0.002)
//        var region=MKCoordinateRegion(center: location, span: span)
//        Map.mapType = MKMapType.Satellite
//        Map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last! as CLLocation
        //        location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
        self.Map.setRegion(region, animated: true)
        
        
        // Stop updating position
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors" + error.localizedDescription)
    }
    
    @IBAction func segmentedControl(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            Map.mapType = .Standard
        case 1:
            Map.mapType = .Satellite
        default: // or case 2
            Map.mapType = .Hybrid
        }
    }

    @IBAction func currentLocation(sender: UIButton) {
        
        
        Map.setCenterCoordinate(Map.userLocation.coordinate, animated: true)

    }
}
