//
//  KittyKlaws.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class FurrySwipes: Ability {
    
    override init() {
        super.init()
        amt = 20.0
        unlockLevel = 1
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
    }
}