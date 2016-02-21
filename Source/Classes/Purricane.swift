//
//  Purricane.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class Purricane: Ability {
    
    override init() {
        super.init()
        //amt = 115.0
        unlockLevel = 12
        abilityType = "Ranged"
        typeOfKitty = "NinjaKitty"
        name = "Purricane"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentDefense -= 0.03
        hero.currentAttack -= 0.2
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " uses " + self.name + "\nby summoning a hurricane."
    }
}