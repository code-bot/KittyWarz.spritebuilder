//
//  FelineFerocity.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Sahaj Bhatt. All rights reserved.
//

import Foundation

class FelineFerocity: Ability {
    
    override init() {
        super.init()
        amt = 90.0
        unlockLevel = 9
        abilityType = "Melee"
        typeOfKitty = "NinjaKitty"
    }
}