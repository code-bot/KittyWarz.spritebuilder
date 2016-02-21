//
//  NewPlayerScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import Firebase

class NewPlayerScene: CCNode {
    weak var miscInfo: CCLabelTTF!
    weak var catName: CCTextField!
    weak var ninja : CCSprite!
    weak var pirate : CCSprite!
    var framecount = 0
    
    func didLoadFromCCB() {
        miscInfo.string = ""
        miscInfo.color = CCColor.redColor()
        ninja.scale = 0.60 * Float(self.contentSize.height)
        pirate.scale = 0.55 * Float(self.contentSize.height)
        //self.performSelector(Selector("functionName"), withObject: self, afterDelay: 1)
    }
    
    func functionName() {
        
    }
    
    func chooseNinja() {
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
                    hero = NinjaKitty(name: self.catName.string, baseHP: userData!["baseHP"] as! Double, attack: userData!["attack"] as! Double, defense: userData!["defense"] as! Double, level: userData!["level"] as! Int, xp: userData!["xp"] as! Int, amtKills: userData!["amtKills"] as! Int, sprite : CCBReader.load("NinjaKitty") as! CCSprite)
                    CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
                } else {
                    self.miscInfo.string = "Username taken"
                }
            })
            //segue and create new ninja
            
        } else {
            miscInfo.string = "Please enter a name for your cat"
        }
    }
    
    func choosePirate() {
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
                        "attack" : 1.0,
                        "baseHP" : 120.0,
                        "defense" : 0.08,
                        "level" : 1,
                        "xp" : 0,
                        "amtKills" : 0
                    ]
                    userData = newPirate
                    myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.string).setValue(newPirate)
                    print("new pirate")
                }
                if (!userExists) {
                    let defaults = NSUserDefaults.standardUserDefaults()
                    
                    defaults.setValue(self.catName.string, forKey: "username")
                    
                    defaults.synchronize()
                    print("save on phone")
                    
                    hero = PirateKitty(name: self.catName.string, baseHP: userData!["baseHP"] as! Double, attack: userData!["attack"] as! Double, defense: userData!["defense"] as! Double, level: userData!["level"] as! Int, xp: userData!["xp"] as! Int, amtKills: userData!["amtKills"] as! Int, sprite : CCBReader.load("PirateKitty") as! CCSprite)
                    CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
                } else {
                    self.miscInfo.string = "Username taken"
                }
            })
            //segue and create new ninja
            
        } else {
            miscInfo.string = "Please enter a name for your cat"
        }    
    }
    
    override func update(delta: CCTime) {
        framecount++
        if (framecount >= 60) {
            //code
            framecount = 0
        }
    }

}
