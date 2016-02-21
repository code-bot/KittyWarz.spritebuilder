//
//  LocationScene.swift
//  KittyWarz
//
//  Created by Rahul Nambiar on 2/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import UIKit
import Firebase
import MapKit
import CoreLocation

class LocationScene: CCNode, MKMapViewDelegate, CLLocationManagerDelegate {
    
    weak var address: CCLabelTTF!
    weak var checkInStatus: CCLabelTTF!
    var locationManager = CLLocationManager()
    var currentLat : Double = 0.0
    var currentLong : Double = 0.0
    
    func didLoadFromCCB() {
        var lat = 0
        var long = 0
        myRootRef.childByAppendingPath("location").observeSingleEventOfType(.Value, withBlock: {
            snapshot in
            let snap = snapshot.value as! [String : Int]
            lat = snap["locationLat"]!
            print(lat)
            long = snap["locationLong"]!
            print(long)
            self.address.string = "<" + String(lat) + ", " + String(long) + ">"
        })
    }
    
    func backToClanInfo() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("ClanInfoScene"))
    }
    
    func regionMonitoring() {
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        print("regionMonitoring")
        locationManager.requestAlwaysAuthorization()
        var lat = 0.0
        var long = 0.0
        myRootRef.childByAppendingPath("location").observeSingleEventOfType(.Value, withBlock: {
            snapshot in
            let snap = snapshot.value as! [String : Double]
            lat = snap["locationLat"]!
            print(lat + 5.0)
            long = snap["locationLong"]!
            print(long + 5.0)
            self.currRegion(lat, long: long)
        })
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]!) {
        print("didUpdateLocations")
        let locValue:CLLocationCoordinate2D! = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        currentLat = locValue.latitude
        currentLong = locValue.longitude
    }
    
    func currRegion(lat: Double, long: Double) {
        if (abs(currentLat) - abs(lat)) < 2 && (abs(currentLat) - abs(lat)) > -2 && (abs(currentLong) - abs(long)) < 2 && (abs(currentLong) - abs(long)) > -2 {
            print("we in")
            self.checkInStatus.string = "Participating in Event!"
        } else {
            print("we not in")
            self.checkInStatus.string = "Not Participating in Event. Drop by Next Time!"
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
}
