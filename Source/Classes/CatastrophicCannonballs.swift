//
//  CatastrophicCannonballs.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class CatastrophicCannonballs: Ability {
    
    override init() {
        super.init()
        //amt = 65.0
        unlockLevel = 7
        abilityType = "Ranged"
        typeOfKitty = "PirateKitty"
        name = "Catastrophic Cannonballs"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack -= 0.2
        hero.currentDefense -= 0.02
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg) + 25
        enemy.currentHP -= dmg
        msg = hero.name + " calls its pirate buddies.\nfor backup." + "Its defense and attack\nare reduced."
    }
}