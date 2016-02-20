//
//  StartScene.swift
//  KittyWarz
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import UIKit

class StartScene: CCScene {
    
    var button: CCButton!
    var kitty: CCSprite!
    
    func didLoadFromCCB() {
        kitty.color = CCColor.redColor()
    }
    
    func nextScene() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("MainScene"))
    }
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        print("hi")
    //        // Do any additional setup after loading the view, typically from a nib.
    //        let defaults = NSUserDefaults.standardUserDefaults()
    //        Firebase.defaultConfig().persistenceEnabled = true
    //        if let user = defaults.stringForKey("username") {
    //            print("username")
    //            print(user)
    //            let usersRef = myRootRef.childByAppendingPath("users")
    //            usersRef.childByAppendingPath(user).keepSynced(true)
    //            usersRef.childByAppendingPath(user).observeSingleEventOfType(.Value, withBlock: {
    //                snapshot in
    //                if let userData = snapshot.value as? [String : AnyObject] {
    //                    if (userData["type"] as! String == "Ninja") {
    //                        hero = NinjaKitty(name: user, baseHP: userData["baseHP"] as! Double, attack: userData["attack"] as! Double, defense: userData["defense"] as! Double, level: userData["level"] as! Int, xp: userData["xp"] as! Int, amtKills: userData["amtKills"] as! Int)
    //                    } else {
    //                        hero = PirateKitty(name: user, baseHP: userData["baseHP"] as! Double, attack: userData["attack"] as! Double, defense: userData["defense"] as! Double, level: userData["level"] as! Int, xp: userData["xp"] as! Int, amtKills: userData["amtKills"] as! Int)
    //                    }
    //                }
    //                })
    //        }
    //        print("done")
    //    }
    //
    //    @IBAction func playGame(sender: AnyObject) {
    //        if (hero != nil) {
    //            self.performSegueWithIdentifier("returningPlayerSegue", sender: self)
    //        } else {
    //            self.performSegueWithIdentifier("newPlayerSegue", sender: nil)
    //        }
    //    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //
    //
}
