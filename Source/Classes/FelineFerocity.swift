//
//  FelineFerocity.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class FelineFerocity: Ability {
    
    override init() {
        super.init()
        //amt = 90.0
        unlockLevel = 9
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
        name = "Feline Ferocity"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " is furious at " + enemy.name + "."
    }
}