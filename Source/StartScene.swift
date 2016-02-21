//
//  StartScene.swift
//  KittyWarz
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import Firebase

var myRootRef = Firebase(url: "https://kittywarsios.firebaseio.com")
var hero : Kitty!
var enemy : Kitty!

class StartScene: CCNode {
    
    func didLoadFromCCB() {
        print("hi")
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        Firebase.defaultConfig().persistenceEnabled = true
        if let user = defaults.stringForKey("username") {
            print("username")
            print(user)
            let usersRef = myRootRef.childByAppendingPath("users")
            usersRef.childByAppendingPath(user).keepSynced(true)
            usersRef.childByAppendingPath(user).observeSingleEventOfType(.Value, withBlock: {
                snapshot in
                if let userData = snapshot.value as? [String : AnyObject] {
                    if (userData["type"] as! String == "Ninja") {
                        hero = NinjaKitty(name: user, baseHP: userData["baseHP"] as! Double, attack: userData["attack"] as! Double, defense: userData["defense"] as! Double, level: userData["level"] as! Int, xp: userData["xp"] as! Int, amtKills: userData["amtKills"] as! Int, sprite: CCBReader.load("NinjaKitty") as! CCSprite)
                        enemy = PirateKitty(name: "Pirate", sprite: CCBReader.load("PirateKitty") as! CCSprite)
                        hero.createEnemy()
                    } else {
                        hero = PirateKitty(name: user, baseHP: userData["baseHP"] as! Double, attack: userData["attack"] as! Double, defense: userData["defense"] as! Double, level: userData["level"] as! Int, xp: userData["xp"] as! Int, amtKills: userData["amtKills"] as! Int, sprite: CCBReader.load("PirateKitty") as! CCSprite)
                        print("hero created")
                        enemy = NinjaKitty(name: "Ninja", sprite: CCBReader.load("NinjaKitty") as! CCSprite)
                        hero.createEnemy()
                        print("enemy created")
                    }
                }
                //print(hero.sprite)
            })
        }
        print("done")
    }
    
    func playGame() {
        print("play")
        if (hero != nil) {
            CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
        } else {
            CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("NewPlayerScene"))
        }
        
    }
}
