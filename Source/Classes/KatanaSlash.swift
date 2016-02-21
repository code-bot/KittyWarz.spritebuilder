//
//  KatanaSlash.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class KatanaSlash: Ability {
    
    override init() {
        super.init()
        amt = 60.0
        unlockLevel = 6
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
        name = "Katana Slash"
    }
}