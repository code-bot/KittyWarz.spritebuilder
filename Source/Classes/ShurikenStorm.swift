//
//  ShurikenStorm.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class ShurikenStorm: Ability {
    
    override init() {
        super.init()
        amt = 95.0
        unlockLevel = 9
        abilityType = "Ranged"
        typeOfKitty = "NinjaKitty"
        name = "Shuriken Storm"
    }
}