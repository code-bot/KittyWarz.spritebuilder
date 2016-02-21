//
//  Meowstorm.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Meowstorm: Ability {
    
    override init() {
        super.init()
        //amt = 115.0
        unlockLevel = 12
        abilityType = "Ranged"
        typeOfKitty = "PirateKitty"
        name = "Meowstorm"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack -= 0.1
        hero.currentHP -= 10
        hero.currentDefense -= 0.03
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg) + 30
        enemy.currentHP -= dmg
        msg = hero.name + " generates a maelstorm."
    }
}