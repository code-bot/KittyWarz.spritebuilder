//
//  Kitty.swift
//  KittyWars
//
//  Created by Rahul Nambiar on 2/19/16.
//  Copyright © 2016 Rahul Nambiar. All rights reserved.
//

import Foundation
import Darwin

class Kitty {
    
    var name : String
    var currentHP : Double
    var baseHP : Double
    var currentAttack: Double
    var attack : Double
    var currentDefense : Double
    var defense : Double
    var level : Int
    var alive : Bool
    var xp : Int
    var abilitiesList : [Ability]
    var amtKills : Int
    var kittyType : String
    var sprite : CCSprite
    
    init(name : String, baseHP : Double, attack : Double, defense : Double,
        level: Int, xp : Int,  amtKills : Int, sprite : CCSprite) {
            self.name = name
            self.baseHP = baseHP
            self.attack = attack
            self.defense = defense
            self.level = level
            self.xp = xp
            self.amtKills = amtKills
            currentHP = baseHP;
            currentAttack = attack;
            currentDefense = defense;
            alive = true;
            abilitiesList = [Purrtect(), ShurikenStorm(), KittyKlaws(), FurrySwipes(),
                ShiverMeWhiskers(), AhoyMeowy(), CatastrophicCannonballs(), Purrley(), DeadlyStare(),
                KatanaSlash(), Catlass(), FelineFerocity()]
            kittyType = ""
            self.sprite = sprite
    }
    
    func resetStats() {
        //reset stats
    }
    
    func levelUp() {
        xp -= 100
        level++
        attack += 0.05 + (0.02 * Double(level))
        defense += 0.03 + (0.01 * Double(level))
        baseHP += 20.0 + (6.00 * Double(level))
    }
    
    func win() {
        amtKills++
        let rand = Int(arc4random_uniform(21) + 50)
        xp += rand + 60
        if xp >= 100 {
            levelUp()
        }
        currentHP = baseHP
        currentAttack = attack
        currentDefense = defense
        enemy.currentHP = enemy.baseHP
        enemy.currentAttack = enemy.attack
        enemy.currentDefense = enemy.defense
    }
    
    func lose() {
        xp -= 15
        if xp < 0 {
            xp = 0
        }
        currentHP = baseHP
        currentAttack = attack
        currentDefense = defense
        enemy.currentHP = enemy.baseHP
        enemy.currentAttack = enemy.attack
        enemy.currentDefense = enemy.defense
        alive = true;
    }
    
    func performAbility(a : Ability, enemy : Kitty) -> Ability {
        print("Idk what kitty I am");
        return a
    }
    
    func enemyPerformAbility(hero : Kitty) -> Ability {
        print("Idk what kitty I am");
        return performAbility(Ability(), enemy: hero)
    }
    
    func createEnemy() {
        print("Not a real kitty")
    }
    
    func displayMeleeAbilities() -> [String : Ability] {
        print("No abilities")
        return [String : Ability]()
    }
    
    func displayRangedAbilities() -> [String : Ability] {
        print("No abilities")
        return [String : Ability]()
    }
    
    func displayDefenseAbilities() -> [String : Ability] {
        print("No abilities")
        return [String : Ability]()
    }
    
    func displayAbilities() -> [String : Ability] {
        return [String : Ability]()
    }
}