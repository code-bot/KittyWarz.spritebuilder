//
//  AhoyMeowy.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class AhoyMeowy: Ability {
    
    override init() {
        super.init()
        //amt = 25.0
        unlockLevel = 4
        abilityType = "Defense"
        typeOfKitty = "PirateKitty"
        name = "Ahoy Meowy"
        msg = "Didn't run"
    }
    
    override func run(hero: Kitty, enemy: Kitty) {
        var heal = Double(arc4random_uniform(15)) + (Double(hero.level) * 10.0)
        enemy.currentAttack -= 0.2
        heal += (heal * (hero.currentDefense) * 2)
        hero.currentHP += heal
        msg = hero.name + " yells 'Ahoy Meowy!'. It's super effective!!"
    }
}