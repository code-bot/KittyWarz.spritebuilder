//
//  PirateKitty.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/19/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation
import Darwin

class PirateKitty: Kitty {
    
    init(name : String, sprite : CCSprite) {
        super.init(name : name, baseHP : 120.0, attack : 1.0, defense : 0.08, level : 1, xp : 0, amtKills : 0, sprite : sprite)
        abilitiesList = [Purrley(), Catluss(), AhoyMeowy(), CatastrophicCannonballs(),
            ShiverMeWhiskers(), FelineFerocity()];
        kittyType = "Pirate"
    }
    
    override init(name : String, baseHP : Double, attack : Double, defense : Double,
        level: Int, xp : Int,  amtKills : Int, sprite : CCSprite) {
            super.init(name : name, baseHP : baseHP, attack : attack, defense : defense, level : level, xp : xp, amtKills : amtKills, sprite: sprite)
            abilitiesList = [Purrley(), Catluss(), AhoyMeowy(), CatastrophicCannonballs(),
                ShiverMeWhiskers(), FelineFerocity()];
            kittyType = "Pirate"
    }
    
    override func performAbility(a : Ability, enemy : Kitty) {
        if a.abilityType == "Defense" {
            self.currentHP += a.amt
            if (currentHP > baseHP) {
                currentHP = baseHP
            }
            defense -= 0.01
            if (defense < 0.04) {
                defense = 0.06
            }
        } else {
            enemy.currentHP -= a.amt
            if (enemy.currentHP < 0) {
                enemy.alive = false
            }
            attack += 0.004
        }
    }
    
    
    
    override func enemyPerformAbility(hero : Kitty) {
        var enemyAbilityList = [FurrySwipes(), DeadlyStare(), KittyKlaws(), KatanaSlash(), Purrtect(),
            ShurikenStorm()];
        var count = 0;
        for a in enemyAbilityList {
            if self.level < a.unlockLevel {
                enemyAbilityList.removeAtIndex(count)
            }
            count++
        }
        let rand = Int(arc4random_uniform(UInt32(enemyAbilityList.count)))
        let a = enemyAbilityList[rand]
        //randomly pick ability
        performAbility(a, enemy : hero)
    }
    
    override func createEnemy() {
        if level < 2 {
            enemy.name = "Ninja Bobberman"
        } else {
            let rand = Int(arc4random_uniform(3)) + level - 1
            enemy.name = "Sensei Meow-Chan"
            for index in 1...(level - 1) {
                enemy.levelUp()
            }
        }
    }
    
    override func displayMeleeAbilities() -> [String : Ability] {
        var meleeList = [String : Ability]();
        for a in abilitiesList {
            if a.abilityType == "Melee" && a.unlockLevel <= level {
                meleeList.updateValue(a, forKey: a.name)
            }
        }
        return meleeList;
    }
    
    override func displayRangedAbilities() -> [String : Ability] {
        var rangedList = [String : Ability]();
        for a in abilitiesList {
            if a.abilityType == "Ranged" && a.unlockLevel <= level {
                rangedList.updateValue(a, forKey: a.name)
            }
        }
        return rangedList;
    }
    
    override func displayDefenseAbilities() -> [String : Ability] {
        var defenseList = [String : Ability]();
        for a in abilitiesList {
            if a.abilityType == "Defense" && a.unlockLevel <= level {
                defenseList.updateValue(a, forKey: a.name)
            }
        }
        return defenseList;
    }
    
    override func displayAbilities() -> [String : Ability] {
        var list = [String : Ability]();
        for a in abilitiesList {
            if a.unlockLevel <= level {
                list.updateValue(a, forKey: a.name)
            }
        }
        return list
    }

}