//
//  Catless.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class Catlass: Ability {
    
    override init() {
        super.init()
        //amt = 30.0
        unlockLevel = 2
        abilityType = "Melee"
        typeOfKitty = "PirateKitty"
        name = "Catlass"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack += 0.2
        enemy.currentAttack -= 0.1
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " fights " + enemy.name + "\nwith his cutlass.\nIncreases its attack, decreases enemy's attack."
    }
}