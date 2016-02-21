//
//  ShiverMeWhiskers.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation
import Darwin

class ShiverMeWhiskers: Ability {
    
    override init() {
        super.init()
        //amt = 50.0
        unlockLevel = 8
        abilityType = "Defense"
        typeOfKitty = "PirateKitty"
        name = "Shiver Me Whiskers"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        enemy.currentDefense -= 0.04
        heal += (heal * (hero.currentDefense) * 2)
        hero.currentHP += heal
        if hero.currentHP > hero.baseHP {
            hero.currentHP = hero.baseHP
        }
        msg = hero.name + " starts playing with its whiskers.\nThis intimidates the enemy."
    }
}