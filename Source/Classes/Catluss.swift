//
//  Catless.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Catluss: Ability {
    
    override init() {
        super.init()
        amt = 30.0
        unlockLevel = 2
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
        name = "Catluss"
    }
}