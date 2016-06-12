//
//  TenthViewController.swift
//  Beacon It
//
//  Created by amol kumar on 12/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TenthViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

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
        
        let location1 = CLLocationCoordinate2DMake(28.556857, 77.266635)
        let annotation1 = MKPointAnnotation()
        
        annotation1.coordinate = location1
        annotation1.title = "Max Healthcare"
        annotation1.subtitle = "Head Office"
        Map.addAnnotation(annotation1)
        
        let location2 = CLLocationCoordinate2DMake(28.559522, 77.265594)
        let annotation2 = MKPointAnnotation()
        
        annotation2.coordinate = location2
        annotation2.title = "Okhla"
        annotation2.subtitle = "Railway Station"
        Map.addAnnotation(annotation2)
        
        let location3 = CLLocationCoordinate2DMake(28.554947, 77.264697)
        let annotation3 = MKPointAnnotation()
        
        annotation3.coordinate = location3
        annotation3.title = "The Founder's Cafe"
        annotation3.subtitle = "Co-working Space"
        Map.addAnnotation(annotation3)
        
        let location4 = CLLocationCoordinate2DMake(28.553702, 77.258859)
        let annotation4 = MKPointAnnotation()
        
        annotation4.coordinate = location4
        annotation4.title = "Lotus Temple"
        annotation4.subtitle = "Bahá'í House of Worship"
        Map.addAnnotation(annotation4)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last! as CLLocation
        //        location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.Map.setRegion(region, animated: true)
        
        
        // Stop updating position
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors" + error.localizedDescription)
    }
    
    @IBAction func clk(sender: UIButton) {
        Map.setCenterCoordinate(Map.userLocation.coordinate, animated: true)
    }
   
    
    @IBAction func seg(sender: UISegmentedControl) {
    
        switch (sender.selectedSegmentIndex) {
        case 0:
            Map.mapType = .Standard
        case 1:
            Map.mapType = .Satellite
        default: // or case 2
            Map.mapType = .Hybrid
        }
        
        
    }

}
