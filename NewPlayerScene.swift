//
//  NewPlayerScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import UIKit
import Firebase

class NewPlayerScene: CCScene {
    weak var miscInfo: CCLabelTTF!
    weak var catName: CCTextField!
    
    func didLoadFromCCB() {
        miscInfo.string = ""
        miscInfo.color = CCColor.redColor()
    }
    
    func chooseNinja(sender: AnyObject) {
        if (catName.string != "") {
            print("not empty")
            var userExists = false
            var userData : [String : AnyObject]?
            myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.string).observeSingleEventOfType(.Value, withBlock: {
                snapshot in
                if let data = snapshot.value as? [String : AnyObject] {
                    userData = data
                    userExists = true
                    print(data)
                } else {
                    userExists = false
                    let newNinja = [
                        "type" : "Ninja",
                        "attack" : 1.2,
                        "baseHP" : 110.0,
                        "defense" : 0.05,
                        "level" : 1,
                        "xp" : 0,
                        "amtKills" : 0
                    ]
                    userData = newNinja
                    myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.string).setValue(newNinja)
                    print("new ninja")
                }
                if (!userExists) {
                    let defaults = NSUserDefaults.standardUserDefaults()
                    
                    defaults.setValue(self.catName.string, forKey: "username")
                    
                    defaults.synchronize()
                    print("save on phone")
                    
                    hero = CCBReader.load("NinjaKitty") as! NinjaKitty
                    hero.setupKitty(self.catName.string, baseHP: userData!["baseHP"] as! Double, attack: userData!["attack"] as! Double, defense: userData!["defense"] as! Double, level: userData!["level"] as! Int, xp: userData!["xp"] as! Int, amtKills: userData!["amtKills"] as! Int)
                    CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("PreviewBattleScene"))
                } else {
                    self.miscInfo.string = "Username taken"
                }
            })
            //segue and create new ninja
            
        } else {
            miscInfo.string = "Please enter a name for your cat"
        }
    }
    
    func choosePirate(sender: AnyObject) {
        if (catName.string != "") {
            print("not empty")
            var userExists = false
            var userData : [String : AnyObject]?
            myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.string).observeSingleEventOfType(.Value, withBlock: {
                snapshot in
                if let data = snapshot.value as? [String : AnyObject] {
                    userData = data
                    userExists = true
                    print(data)
                } else {
                    userExists = false
                    let newPirate = [
                        "type" : "Pirate",
                        "attack" : 1.2,
                        "baseHP" : 110.0,
                        "defense" : 0.05,
                        "level" : 1,
                        "xp" : 0,
                        "amtKills" : 0
                    ]
                    userData = newPirate
                    myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.string).setValue(newPirate)
                    print("new ninja")
                }
                if (!userExists) {
                    let defaults = NSUserDefaults.standardUserDefaults()
                    
                    defaults.setValue(self.catName.string, forKey: "username")
                    
                    defaults.synchronize()
                    print("save on phone")
                    
                    hero = CCBReader.load("PirateKitty") as!PirateKitty
                    hero.setupKitty(self.catName.string, baseHP: userData!["baseHP"] as! Double, attack: userData!["attack"] as! Double, defense: userData!["defense"] as! Double, level: userData!["level"] as! Int, xp: userData!["xp"] as! Int, amtKills: userData!["amtKills"] as! Int)
                    CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("PreviewBattleScene"))
                } else {
                    self.miscInfo.string = "Username taken"
                }
            })
            //segue and create new ninja
            
        } else {
            miscInfo.string = "Please enter a name for your cat"
        }    }

}
