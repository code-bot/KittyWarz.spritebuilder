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
        amt = 25.0
        unlockLevel = 4
        abilityType = "Defense"
        typeOfKitty = "PirateKitty"
        name = "Ahoy Meowy"
    }
}