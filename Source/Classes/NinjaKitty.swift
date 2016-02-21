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
    
    init(name : String, sprite: CCSprite) {
        super.init(name : name, baseHP : 110.0, attack : 1.2, defense : 0.08, level : 1, xp : 0, amtKills : 0, sprite : sprite)
        abilitiesList = [FurrySwipes(), DeadlyStare(), KittyKlaws(), KatanaSlash(), Purrtect(),
            ShurikenStorm()]
        kittyType = "Ninja"
    }
    
    override init(name : String, baseHP : Double, attack : Double, defense : Double,
        level: Int, xp : Int,  amtKills : Int, sprite: CCSprite) {
            super.init(name : name, baseHP : baseHP, attack : attack, defense : defense, level : level, xp : xp, amtKills : amtKills, sprite: sprite)
            abilitiesList = [FurrySwipes(), DeadlyStare(), KittyKlaws(), KatanaSlash(), Purrtect(),
                ShurikenStorm()]
            kittyType = "Ninja"
    }
    
    override func resetStats() {
        baseHP = 110.0
        attack = 1.2
        defense = 0.08
        level = 1
        xp = 0
        amtKills = 0
        currentHP = baseHP
    }

    
    override func performAbility(a : Ability, enemy : Kitty) -> Ability {
        a.run(self, enemy: enemy)
        if self.currentDefense < 0.02 || self.currentDefense > 0.50 {
            self.currentDefense = 0.45
        }
        if enemy.currentDefense < 0.02 || enemy.currentDefense > 0.50 {
            enemy.currentDefense = 0.45
        }
        if self.currentAttack > 2.00 || self.currentAttack < 0.50 {
            self.currentAttack = 1.00
        }
        if enemy.currentAttack > 2.00 || enemy.currentAttack < 0.50 {
            enemy.currentAttack = 1.00
        }
        return a
    }
    
    override func enemyPerformAbility(hero : Kitty) -> Ability {
        
        var enemyAbilityList = (self.displayAbilities().values).reverse()
        let rand = Int(arc4random_uniform(UInt32(enemyAbilityList.count)))
        let a = enemyAbilityList[rand]
        //randomly pick ability
        return performAbility(a, enemy : hero)
    }
    
    override func createEnemy(){
        if level < 2 {
            enemy.name = "Pirate Bobberman"
        } else {
            let rand = Int(arc4random_uniform(3)) + level - 1
            enemy.name = "Captain Blackwhiskers"
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