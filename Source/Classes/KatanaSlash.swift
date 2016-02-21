//
//  KatanaSlash.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class KatanaSlash: Ability {
    
    override init() {
        super.init()
        //amt = 60.0
        unlockLevel = 5
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
        name = "Katana Slash"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentHP -= 10
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg) + 15
        enemy.currentHP -= dmg
        msg = hero.name + " whips out its Katana\nand performs the traditional " + self.name + ".\n" + hero.name + " accidentally cut itself."
    }
}