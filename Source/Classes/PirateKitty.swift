//
//  PirateKitty.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/19/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation

class PirateKitty: Kitty {
    
    init(name : String) {
        super.init(name: name, baseHP : 120.0, attack : 1.0, defense : 0.08, level : 1, xp : 0, amtKills : 0)
        abilitiesList = [Purrley(), Catluss(), AhoyMeowy(), CatastrophicCannonballs(),
            ShiverMeWhiskers(), FelineFerocity()];
        kittyType = "Pirate"
    }
    
    override init(name : String, baseHP : Double, attack : Double, defense : Double,
        level: Int, xp : Int,  amtKills : Int) {
            super.init(name: name, baseHP: baseHP, attack: attack, defense: defense, level: level, xp: xp, amtKills: amtKills)
            abilitiesList = [Purrley(), Catluss(), AhoyMeowy(), CatastrophicCannonballs(),
                ShiverMeWhiskers(), FelineFerocity()];
            kittyType = "Pirate"
    }
    
    func performAbility(a : Ability, enemy : Kitty) {
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
    
    
    
    func enemyPerformAbility(hero : PirateKitty) {
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
    
    func createEnemy() -> NinjaKitty {
        var enemy : NinjaKitty
        if level < 2 {
            enemy = NinjaKitty(name : "Ninja Bobberman")
        } else {
            let rand = Int(arc4random_uniform(3)) + level - 1
            enemy = NinjaKitty(name : "Sensei Meow-Chan")
            for index in 1...(level - 1) {
                enemy.levelUp()
            }
        }
        return enemy;
    }
    
    func displayMeleeAbilities() -> [Ability] {
        var meleeList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Melee" && a.unlockLevel <= level {
                meleeList.append(a)
            }
        }
        return meleeList;
    }
    
    func displayRangedAbilities() -> [Ability] {
        var rangedList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Ranged" && a.unlockLevel <= level {
                rangedList.append(a)
            }
        }
        return rangedList;
    }
    
    func displayDefenseAbilities() -> [Ability] {
        var defenseList = [Ability]();
        for a in abilitiesList {
            if a.abilityType == "Defense" && a.unlockLevel <= level {
                defenseList.append(a)
            }
        }
        return defenseList;
    }
}