//
//  NewPlayerController.swift
//  KittyWars
//
//  Created by Sahaj Bhatt on 2/19/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import UIKit

class NewPlayerController: UIViewController {
    
//    @IBOutlet weak var catName: UITextField!
//    @IBOutlet weak var miscInfo: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        miscInfo.text = "";
//    }
//    
//    @IBAction func chooseNinja(sender: AnyObject) {
//        if (catName.text != "") {
//            print("not empty")
//            var userExists = false
//            myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.text).observeSingleEventOfType(.Value, withBlock: {
//                    snapshot in
//                if let userData = snapshot.value as? [String : AnyObject] {
//                    userExists = true
//                    print(userData)
//                } else {
//                    userExists = false
//                    let newNinja = [
//                        "type" : "Ninja",
//                        "attack" : 1.2,
//                        "baseHP" : 110.0,
//                        "defense" : 0.05,
//                        "level" : 1,
//                        "xp" : 0,
//                        "amtKills" : 0
//                    ]
//                    myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.text).setValue(newNinja)
//                    print("new ninja")
//                }
//                if (!userExists) {
//                    let defaults = NSUserDefaults.standardUserDefaults()
//                    
//                    defaults.setValue(self.catName.text, forKey: "username")
//                    
//                    defaults.synchronize()
//                    print("save on phone")
//                    
//                    hero = NinjaKitty(name: self.catName.text!)
//                    self.performSegueWithIdentifier("newUserCreated", sender: nil)
//                } else {
//                    self.miscInfo.text = "Username taken"
//                }
//            })
//            //segue and create new ninja
//            
//        } else {
//            miscInfo.text = "Please enter a name for your cat"
//        }
//    }
//    
//    @IBAction func choosePirate(sender: AnyObject) {
//        if (catName.text != "") {
//            print("not empty")
//            var userExists = false
//            myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.text).observeSingleEventOfType(.Value, withBlock: {
//                snapshot in
//                if let userData = snapshot.value as? [String : AnyObject] {
//                    userExists = true
//                    print(userData)
//                } else {
//                    userExists = false
//                    let newPirate = [
//                        "type" : "Pirate",
//                        "attack" : 1.0,
//                        "baseHP" : 120.0,
//                        "defense" : 0.08,
//                        "level" : 1,
//                        "xp" : 0,
//                        "amtKills" : 0
//                    ]
//                    myRootRef.childByAppendingPath("users").childByAppendingPath(self.catName.text).setValue(newPirate)
//                    print("new pirate")
//                }
//                if (!userExists) {
//                    let defaults = NSUserDefaults.standardUserDefaults()
//                    
//                    defaults.setValue(self.catName.text, forKey: "username")
//                    
//                    defaults.synchronize()
//                    print("save on phone")
//                    
//                    hero = PirateKitty(name: self.catName.text!)
//                    self.performSegueWithIdentifier("newUserCreated", sender: nil)
//                } else {
//                    self.miscInfo.text = "Username taken"
//                }
//            })
//            //segue and create new pirate
//            
//        } else {
//            miscInfo.text = "Please enter a name for your cat"
//        }
//
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
}
