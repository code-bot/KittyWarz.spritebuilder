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
        amt = 65.0
        unlockLevel = 6
        abilityType = "Ranged"
        typeOfKitty = "PirateKitty"
        name = "Catastrophic Cannonballs"
    }
}