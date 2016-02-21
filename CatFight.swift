//
//  CatFight.swift
//  KittyWarz
//
//  Created by Karan Lakhani on 2/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import Darwin

class CatFight: Ability {
    
    override init() {
        super.init()
        //amt = 50.0
        unlockLevel = 4
        abilityType = "Melee"
        typeOfKitty = "PirateKitty"
        name = "Cat Fight"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack += 0.2
        enemy.currentAttack += 0.2
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = hero.name + " challenges " + enemy.name + "\nto a duel. Increases\nboth of their attack."
    }
}