//
//  Purrtect.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class Purrtect: Ability {
    
    override init() {
        super.init()
        //amt = 50.0
        unlockLevel = 8
        abilityType = "Defense"
        typeOfKitty = "NinjaKitty"
        name = "Purrtect"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        hero.currentDefense += 0.04
        heal += (heal * (hero.currentDefense * 2))
        hero.currentHP += heal
        msg = "Lonely cat lovers hear " + hero.name + "\n's purrs and come running to nurture the kitty."
    }
}