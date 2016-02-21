//
//  Purrtect.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class Purrtect: Ability {
    
    override init() {
        super.init()
        amt = 50.0
        unlockLevel = 7
        abilityType = "Defense"
        typeOfKitty = "NinjaKitty"
        name = "Purrtect"
    }
}