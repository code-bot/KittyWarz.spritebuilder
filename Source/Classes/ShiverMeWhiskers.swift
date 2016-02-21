//
//  ShiverMeWhiskers.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class ShiverMeWhiskers: Ability {
    
    override init() {
        super.init()
        amt = 50.0
        unlockLevel = 7
        abilityType = "Defense"
        typeOfKitty = "PirateKitty"
        name = "Shiver Me Whiskers"
    }
}