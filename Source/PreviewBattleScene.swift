//
//  PreviewBattleScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation

class PreviewBattleScene: CCNode {

    weak var you : CCNode!
    weak var opponent : CCNode!
    weak var yourLevel : CCLabelTTF!
    weak var oppLevel : CCLabelTTF!
    weak var yourHP : CCLabelTTF!
    weak var oppHP : CCLabelTTF!
    weak var ranged : CCButton!
    weak var melee : CCButton!
    weak var defense : CCButton!
    weak var abilities : CCNode!
    weak var info : CCNode!
    weak var infoText : CCLabelTTF!
    weak var menu : CCNode!
    var spriteHero : CCSprite!
    var spriteEnemy : CCSprite!
    
    func didLoadFromCCB() {
        print("add child")
        hero.createEnemy()
        spriteHero = hero.sprite
        spriteEnemy = enemy.sprite
        if (enemy.kittyType == "Ninja") {
            (spriteEnemy.getChildByName("NinjaKitty", recursively: false) as! CCSprite).flipX = true
        } else {
            (spriteEnemy.getChildByName("PirateKitty", recursively: false) as! CCSprite).flipX = true
        }
        //(spriteEnemy.getChildByName("NinjaKitty", recursively: false).getChildByName("katana", recursively: false) as! CCSprite).flipX = true
        spriteHero.scale = 0.002 * Float(self.contentSize.height)
        spriteEnemy.scale = 0.002 * Float(self.contentSize.height)
        you.addChild(spriteHero)
        opponent.addChild(spriteEnemy)
        yourLevel.string = String(hero.level)
        oppLevel.string = String(enemy.level)
        yourHP.string = String(hero.baseHP)
        oppHP.string = String(enemy.baseHP)
        infoText.string = hero.name + " challenges " + enemy.name
    }
    
    //spriteHero.runAnimationSequenceNamed...
    func useAbility(sender: CCButton!) {
        var map = hero.displayAbilities()
        let rand = Int(arc4random_uniform(UInt32(2)))
        var ended = false
        var win = false
        var enemyAbility = Ability()
        var heroAbility = Ability()
        if (rand == 0) {
            enemyAbility = enemy.enemyPerformAbility(hero)
            switch (enemyAbility.abilityType) {
            case "Melee":
                if (enemy.kittyType == "Ninja") {
                    spriteEnemy.animationManager.runAnimationsForSequenceNamed("katanaAttack");
                } else {
                    spriteEnemy.animationManager.runAnimationsForSequenceNamed("CutlassAttack")
                }
                break
            case "Ranged":
                if (enemy.kittyType == "Ninja") {
                    spriteEnemy.animationManager.runAnimationsForSequenceNamed("shurikenAttack");
                } else {
                    spriteEnemy.animationManager.runAnimationsForSequenceNamed("gunAttack")
                }
                break
            default :
                break
            }
            infoText.string = enemy.name + " used " + enemyAbility.name
            if (hero.currentHP <= 0) {
                yourHP.string = String(0)
                infoText.string = infoText.string + "\n" + "YOU LOSE"
                hero.lose()
                ended = true
            } else {
                yourHP.string = String(hero.currentHP)
                oppHP.string = String(enemy.currentHP)
                heroAbility = hero.performAbility(map[sender.title]!, enemy: enemy)
                switch (heroAbility.abilityType) {
                case "Melee":
                    if (hero.kittyType == "Ninja") {
                        spriteHero.animationManager.runAnimationsForSequenceNamed("katanaAttack");
                    } else {
                        spriteHero.animationManager.runAnimationsForSequenceNamed("CutlassAttack")
                    }
                    break
                case "Ranged":
                    if (hero.kittyType == "Ninja") {
                        spriteHero.animationManager.runAnimationsForSequenceNamed("shurikenAttack");
                    } else {
                        spriteHero.animationManager.runAnimationsForSequenceNamed("gunAttack")
                    }
                    break
                default :
                    break
                }

                infoText.string = infoText.string + "\n" + hero.name + " used " + heroAbility.name
                yourHP.string = String(hero.currentHP)
                if (enemy.currentHP <= 0) {
                    oppHP.string = String(0)
                    infoText.string = infoText.string + "\n" + "YOU WON"
                    win = true
                    hero.win()
                    ended = true
                } else {
                    oppHP.string = String(enemy.currentHP)
                }
            }
        } else {
            heroAbility = hero.performAbility(map[sender.title]!, enemy: enemy)
            switch (heroAbility.abilityType) {
            case "Melee":
                if (hero.kittyType == "Ninja") {
                    spriteHero.animationManager.runAnimationsForSequenceNamed("katanaAttack");
                } else {
                    spriteHero.animationManager.runAnimationsForSequenceNamed("CutlassAttack")
                }
                break
            case "Ranged":
                if (hero.kittyType == "Ninja") {
                    spriteHero.animationManager.runAnimationsForSequenceNamed("shurikenAttack");
                } else {
                    spriteHero.animationManager.runAnimationsForSequenceNamed("gunAttack")
                }
                break
            default :
                break
            }
            infoText.string = hero.name + " used " + heroAbility.name
            if (enemy.currentHP <= 0) {
                oppHP.string = String(0)
                infoText.string = infoText.string + "\n" + "YOU WON"
                win = true
                hero.win()
                ended = true
            } else {
                oppHP.string = String(enemy.currentHP)
                yourHP.string = String(hero.currentHP)
                enemyAbility = enemy.enemyPerformAbility(hero)
                switch (enemyAbility.abilityType) {
                case "Melee":
                    if (enemy.kittyType == "Ninja") {
                        spriteEnemy.animationManager.runAnimationsForSequenceNamed("katanaAttack");
                    } else {
                        spriteEnemy.animationManager.runAnimationsForSequenceNamed("CutlassAttack")
                    }
                    break
                case "Ranged":
                    if (enemy.kittyType == "Ninja") {
                        spriteEnemy.animationManager.runAnimationsForSequenceNamed("shurikenAttack");
                    } else {
                        spriteEnemy.animationManager.runAnimationsForSequenceNamed("gunAttack")
                    }
                    break
                default :
                    break
                }
                infoText.string = infoText.string + "\n" + enemy.name + " used " + enemyAbility.name
                oppHP.string = String(enemy.currentHP)
                if (hero.currentHP <= 0) {
                    yourHP.string = String(0)
                    infoText.string = infoText.string + "\n" + "YOU LOSE"
                    hero.lose()
                    ended = true
                } else {
                    yourHP.string = String(hero.currentHP)
                }
            }
            
        }
        if (ended) {
            hero.sprite.removeFromParent()
            enemy.sprite.removeFromParent()
            abilities.removeAllChildren()
            if (hero.kittyType == "Ninja") {
                enemy = PirateKitty(name: "Pirate", sprite: CCBReader.load("PirateKitty") as! CCSprite)
                let newNinja = [
                    "type" : "Ninja",
                    "attack" : hero.attack,
                    "baseHP" : hero.baseHP,
                    "defense" : hero.defense,
                    "level" : hero.level,
                    "xp" : hero.xp,
                    "amtKills" : hero.amtKills
                ]
                myRootRef.childByAppendingPath("users").childByAppendingPath(hero.name).setValue(newNinja)
                if (win) {
                    myRootRef.childByAppendingPath("ninjasKillCount").observeSingleEventOfType(.Value, withBlock: {
                        snapshot in
                        myRootRef.childByAppendingPath("ninjasKillCount").setValue(snapshot.value as! Int + 1)
                    })
                    
                }
            } else {
                enemy = NinjaKitty(name: "Ninja", sprite: CCBReader.load("NinjaKitty") as! CCSprite)
                let newPirate = [
                    "type" : "Pirate",
                    "attack" : hero.attack,
                    "baseHP" : hero.baseHP,
                    "defense" : hero.defense,
                    "level" : hero.level,
                    "xp" : hero.xp,
                    "amtKills" : hero.amtKills
                ]
                myRootRef.childByAppendingPath("users").childByAppendingPath(hero.name).setValue(newPirate)
                if (win) {
                    myRootRef.childByAppendingPath("piratesKillCount").observeSingleEventOfType(.Value, withBlock: {
                        snapshot in
                        myRootRef.childByAppendingPath("piratesKillCount").setValue(snapshot.value as! Int + 1)
                    })
                    
                }
            }
            CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
        }
        
    }
    
    func getRanged() {
        abilities.removeAllChildren()
        let map = hero.displayRangedAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.name = ability.name
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            abilities.addChild(button)
            index = index + 1.0
        }
    }
    
    func getMelee() {
        abilities.removeAllChildren()
        let map = hero.displayMeleeAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            abilities.addChild(button)
            index = index + 1.0
        }
    }
    
    func getDefense() {
        abilities.removeAllChildren()
        let map = hero.displayDefenseAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            abilities.addChild(button)
            index = index + 1.0
        }
    }
}
