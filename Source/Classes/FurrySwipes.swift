//
//  KittyKlaws.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation
import Darwin

class FurrySwipes: Ability {
    
    override init() {
        super.init()
        //amt = 20.0
        unlockLevel = 1
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
        name = "Furry Swipes"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var dmg = Double(arc4random_uniform(10)) + (Double(hero.level) * 10.0)
        hero.currentAttack += 0.2
        hero.currentDefense -= 0.02
        dmg = (hero.currentAttack * dmg) - (enemy.currentDefense * dmg)
        enemy.currentHP -= dmg
        msg = self.name + " increases " + hero.name + "'s\nattack power. In its own madness,\nits defenses are lowered."
    }
}