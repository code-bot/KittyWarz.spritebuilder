//
//  Meowstorm.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class Meowstorm: Ability {
    
    override init() {
        super.init()
        amt = 115.0
        unlockLevel = 12
        abilityType = "Ranged"
        typeOfKitty = "PirateKitty"
    }
}