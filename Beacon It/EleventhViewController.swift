//
//  EleventhViewController.swift
//  Beacon It
//
//  Created by amol kumar on 12/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EleventhViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

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
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.Map.setRegion(region, animated: true)
        
        
        // Stop updating position
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors" + error.localizedDescription)
    }
    

   

}
