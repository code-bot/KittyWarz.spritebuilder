//
//  KittyKlaws.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class KittyKlaws: Ability {
    
    override init() {
        super.init()
        //amt = 25.0
        unlockLevel = 4
        abilityType = "Defense"
        typeOfKitty = "NinjaKitty"
        name = "Kitty Klaws"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        hero.currentAttack += 0.1
        enemy.currentDefense -= 0.01
        heal += (heal * (hero.currentDefense * 2))
        hero.currentHP += heal
        msg = hero.name + " sharpen its claws by using\n" + self.name + ". Scared of sharp things,\n" + enemy.name + "'s defense decreases."
    }
}