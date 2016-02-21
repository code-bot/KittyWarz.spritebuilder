//
//  Ability.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/19/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class Ability {
    var abilityType = ""
    var typeOfKitty = ""
    var unlockLevel = 0
    var amt = 0.0
    var name = ""
    
    init() {
        let rand = Int(arc4random_uniform(UInt32(5)))
        let otherRand = Int(arc4random_uniform(UInt32(1)))
        if otherRand == 0 {
            amt = amt + Double(rand) + 1
        } else {
            amt = amt + Double(rand) - 1
        }
    }
}