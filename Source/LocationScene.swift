//
//  LocationScene.swift
//  KittyWarz
//
//  Created by Rahul Nambiar on 2/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import UIKit
import Firebase

class LocationScene: CCNode {
    
    weak var address: CCLabelTTF!
    
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
            //self.address.string = "<" + String(lat) + ","
            self.address.string = "<" + String(lat) + ", " + String(long) + ">"
        })
    }
    
    func backToClanInfo() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("ClanInfoScene"))
    }
}
