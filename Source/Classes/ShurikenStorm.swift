//
//  ShurikenStorm.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation
import Darwin

class ShurikenStorm: Ability {
    
    override init() {
        super.init()
        //amt = 95.0
        unlockLevel = 6
        abilityType = "Ranged"
        typeOfKitty = "NinjaKitty"
        name = "Shuriken Storm"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentDefense -= 0.03
        hero.currentAttack -= 0.2
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg) + 25
        enemy.currentHP -= dmg
        msg = hero.name + " uses " + self.name + "\n. It sacrifices its attack and defense stats\nto channel the fury of a thousand kitty gods."
    }
}