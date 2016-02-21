//
//  VitaminC(at).swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class VitaminC: Ability {
    
    override init() {
        super.init()
        //amt = 85.0
        unlockLevel = 10
        abilityType = "Defense"
        typeOfKitty = "PirateKitty"
        name = "Vitamin C"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        hero.currentDefense += 0.05
        heal += (heal * (hero.currentDefense))
        hero.currentHP += heal
        if hero.currentHP > hero.baseHP {
            hero.currentHP = hero.baseHP
        }
        msg = hero.name + " cures its own scurvy."
    }
}