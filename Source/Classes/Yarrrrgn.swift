//
//  Yarrrrgn.swift
//  KittyWarz
//
//  Created by Karan Lakhani on 2/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import Darwin

class Yarrrrrgn: Ability {
    
    override init() {
        super.init()
        //amt = 75.0
        unlockLevel = 9
        abilityType = "Melee"
        typeOfKitty = "PirateKitty"
        name = "Yarrrrrgn"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack += 0.2
        enemy.currentAttack -= 0.1
        enemy.currentDefense -= 0.01
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg) + 15
        enemy.currentHP -= dmg
        msg = "YARRRRRRRGN!!!!"
    }
}