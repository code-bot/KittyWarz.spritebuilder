//
//  DeadlyStare.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class DeadlyStare: Ability {
    
    override init() {
        super.init()
        //amt = 30.0
        unlockLevel = 2
        abilityType = "Ranged"
        typeOfKitty = "NinjaKitty"
        name = "Deadly Stare"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentDefense -= 0.025
        enemy.currentDefense -= 0.02
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " uses " + self.name + ".\nThis awkward moment decreases both\nits and its enemy's defense."
    }
}