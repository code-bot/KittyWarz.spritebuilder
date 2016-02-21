//
//  Purrley.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Purrley: Ability {
    
    override init() {
        super.init()
        //amt = 20.0
        unlockLevel = 1
        abilityType = "Ranged"
        typeOfKitty = "PirateKitty"
        name = "Purrley"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentHP += 5
        enemy.currentAttack -= 0.1
        enemy.currentDefense -= 0.01
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " sends out a gentle purr.\n" + "Increases its own health" + "\nDecreases enemy attack and defense."
    }
}