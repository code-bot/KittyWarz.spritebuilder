//
//  NinjaKitty.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/19/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation
import Darwin

class NinjaKitty: Kitty {
    
    func setupKitty(name : String) {
        nameOfKitty = name
        baseHP = 110.0
        attack = 1.2
        defense = 0.05
        level = 1
        xp = 0
        amtKills = 0
        alive = true
        currentHP = baseHP
        abilitiesList = [FurrySwipes(), DeadlyStare(), KittyKlaws(), KatanaSlash(), Purrtect(),
            ShurikenStorm()];
        kittyType = "Ninja"
    }
    
    func loadKitty(name : String, baseHP : Double, attack : Double, defense : Double,
        level: Int, xp : Int,  amtKills : Int) {
            nameOfKitty = name
            self.baseHP = baseHP
            self.attack = attack
            self.defense = defense
            self.level = level
            self.xp = xp
            self.amtKills = amtKills
            alive = true
            currentHP = baseHP
            abilitiesList = [FurrySwipes(), DeadlyStare(), KittyKlaws(), KatanaSlash(), Purrtect(),
                ShurikenStorm()];
            kittyType = "Ninja"
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
                enemy.alive = false;
            }
            attack += 0.004
        }
    }
    
    override func enemyPerformAbility(hero : Kitty) {
        var enemyAbilityList = [Purrley(), Catluss(), AhoyMeowy(), CatastrophicCannonballs(),
            ShiverMeWhiskers(), FelineFerocity()];
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
    
//    override func createEnemy() -> Kitty {
//        var enemy : PirateKitty
//        if level < 2 {
//            enemy = PirateKitty(name : "Pirate Bobberman")
//        } else {
//            let rand = Int(arc4random_uniform(3)) + level - 1
//            enemy = PirateKitty(name : "Captain Blackwhiskers")
//            for index in 1...(level - 1) {
//                enemy.levelUp()
//            }
//        }
//        return enemy;
//    }
    
    override func displayMeleeAbilities() -> [Ability] {
        var meleeList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Melee" && a.unlockLevel <= level {
                meleeList.append(a)
            }
        }
        return meleeList;
    }
    
    override func displayRangedAbilities() -> [Ability] {
        var rangedList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Ranged" && a.unlockLevel <= level {
                rangedList.append(a)
            }
        }
        return rangedList;
    }
    
    override func displayDefenseAbilities() -> [Ability] {
        var defenseList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Defense" && a.unlockLevel <= level {
                defenseList.append(a)
            }
        }
        return defenseList;
    }
}