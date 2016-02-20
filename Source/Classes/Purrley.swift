//
//  Purrley.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Purrley: Ability {
    
    override init() {
        super.init()
        amt = 15.0
        unlockLevel = 1
        abilityType = "Melee"
        typeOfKitty = "PirateKitty"
    }
}