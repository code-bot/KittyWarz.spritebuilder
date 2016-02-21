//
//  NinjaNap.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class NinjaNap: Ability {
    
    override init() {
        super.init()
        //amt = 85.0
        unlockLevel = 10
        abilityType = "Defense"
        typeOfKitty = "NinjaKitty"
        name = "Ninja Nap"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        hero.currentDefense += 0.02
        hero.currentAttack += 0.2
        heal += (heal * (hero.currentDefense))
        hero.currentHP += heal
        msg = "Snorlax uses rest."
    }
}