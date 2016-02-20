//
//  MapController.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager : CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        let location = locations[locations.count - 1]
        let currentLat = location.coordinate.latitude
        let currentLong = location.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude : currentLat, longitude : currentLong)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta : 0.2, longitudeDelta : 0.2))
        self.address.text = location.description
        self.mapView.setRegion(region, animated : true)
        self.locationManager.stopUpdatingLocation()
    }
    
    @IBAction func regionMonitoring(sender: AnyObject) {
        locationManager.requestAlwaysAuthorization()
        //test vals - need to get lat, long from db
        let currentRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude : 42.3, longitude : -83.7), radius : 200, identifier : "Kitty Social")
        locationManager.startMonitoringForRegion(currentRegion)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(":( Errors: " + error.localizedDescription)
    }
    
    func locationManager(manager : CLLocationManager, didEnterRegion region : CLRegion) {
        NSLog("Region Entered");
    }
    
    func locationManager(manager : CLLocationManager, didExitRegion region : CLRegion) {
        NSLog("Region Exited");
    }
    
}


