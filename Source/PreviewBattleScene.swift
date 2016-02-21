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
    var done = true
    
    func didLoadFromCCB() {
        print("add child")
        hero.createEnemy()
        spriteHero = hero.sprite
        spriteEnemy = enemy.sprite
        if (enemy.kittyType == "Ninja") {
            (spriteEnemy.getChildByName("NinjaKitty", recursively: false) as! CCSprite).flipX = true
            (spriteEnemy.getChildByName("NinjaKitty", recursively: false) as! CCSprite).scale = 0.002 * Float(self.contentSize.height)
        } else {
            (spriteEnemy.getChildByName("PirateKitty", recursively: false) as! CCSprite).flipX = true
            (spriteEnemy.getChildByName("PirateKitty", recursively: false) as! CCSprite).scale = 0.002 * Float(self.contentSize.height)
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
        if (done) {
            var map = hero.displayAbilities()
            let rand = Int(arc4random_uniform(UInt32(2)))
            var ended = false
            var win = false
            var enemyAbility = Ability()
            var heroAbility = Ability()
            infoText.string = ""
            done = false
            if (rand == 0) {
                //Perform Enemy Ability
                enemyAbility = enemy.enemyPerformAbility(hero)
                //Enemy Animation
                NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("enemyAnimation:"), userInfo: enemyAbility, repeats: false)
                //Update Text
                NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("updateText:"), userInfo: enemy.name + " used " + enemyAbility.name, repeats: false)
                //Update Enemy Label
                oppHP.string = String(enemy.currentHP)
                //Hero dead?
                if (hero.currentHP <= 0) {
                    //Update Text
                    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("updateText:"), userInfo: "\n" + "YOU LOSE", repeats: false)
                    //Update Your Label
                    yourHP.string = String(0)
                    //End Battle as Lose
                    NSTimer.scheduledTimerWithTimeInterval(5.5, target: self, selector: Selector("endBattle:"), userInfo: false, repeats: false)
                    NSTimer.scheduledTimerWithTimeInterval(5.6, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                } else {
                    //Update Your Label
                    yourHP.string = String(hero.currentHP)
                    //Perform Hero Ability
                    heroAbility = hero.performAbility(map[sender.title]!, enemy: enemy)
                    //Hero Animation
                    NSTimer.scheduledTimerWithTimeInterval(1.6, target: self, selector: Selector("heroAnimation:"), userInfo: heroAbility, repeats: false)
                    //Update Text
                    NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("updateText:"), userInfo: "\n" + hero.name + " used " + heroAbility.name, repeats: false)
                    //Update Your Label
                    yourHP.string = String(hero.currentHP)
                    //Enemy dead?
                    if (enemy.currentHP <= 0) {
                        //Update Text
                        NSTimer.scheduledTimerWithTimeInterval(3.5, target: self, selector: Selector("updateText:"), userInfo: "\n" + "YOU WIN", repeats: false)
                        //Update Enemy Label
                        oppHP.string = String(0)
                        //End Battle as Win
                        NSTimer.scheduledTimerWithTimeInterval(7.0, target: self, selector: Selector("endBattle:"), userInfo: true, repeats: false)
                        NSTimer.scheduledTimerWithTimeInterval(7.1, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                    } else {
                        //Update Enemy Label
                        oppHP.string = String(enemy.currentHP)
                        NSTimer.scheduledTimerWithTimeInterval(3.1, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                    }
                    
                }
            } else {
                //Perform Hero Ability
                heroAbility = hero.performAbility(map[sender.title]!, enemy: enemy)
                //Hero Animation
                NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("heroAnimation:"), userInfo: heroAbility, repeats: false)
                //Update Text
                NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("updateText:"), userInfo: hero.name + " used " + heroAbility.name, repeats: false)
                //Update Your Label
                yourHP.string = String(hero.currentHP)
                //Enemy dead?
                if (enemy.currentHP <= 0) {
                    //Update Text
                    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("updateText:"), userInfo: "\n" + "YOU WIN", repeats: false)
                    //Update Enemy Label
                    oppHP.string = String(0)
                    //End Battle as Win
                    NSTimer.scheduledTimerWithTimeInterval(5.5, target: self, selector: Selector("endBattle:"), userInfo: true, repeats: false)
                    NSTimer.scheduledTimerWithTimeInterval(5.6, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                } else {
                    //Update Enemy Label
                    oppHP.string = String(enemy.currentHP)
                    //Perform Enemy Ability
                    enemyAbility = enemy.enemyPerformAbility(hero)
                    //Enemy Animation
                    NSTimer.scheduledTimerWithTimeInterval(1.6, target: self, selector: Selector("enemyAnimation:"), userInfo: enemyAbility, repeats: false)
                    //Update Text
                    NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("updateText:"), userInfo: "\n" + enemy.name + " used " + enemyAbility.name, repeats: false)
                    //Update Enemy Label
                    oppHP.string = String(enemy.currentHP)
                    //Hero dead?
                    if (hero.currentHP <= 0) {
                        //Update Text
                        NSTimer.scheduledTimerWithTimeInterval(3.5, target: self, selector: Selector("updateText:"), userInfo: "\n" + "YOU LOSE", repeats: false)
                        //Update Your Label
                        yourHP.string = String(0)
                        //End Battle as Lose
                        NSTimer.scheduledTimerWithTimeInterval(7.0, target: self, selector: Selector("endBattle:"), userInfo: false, repeats: false)
                        NSTimer.scheduledTimerWithTimeInterval(7.1, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                    } else {
                        //Update Your Label
                        yourHP.string = String(hero.currentHP)
                        NSTimer.scheduledTimerWithTimeInterval(3.1, target: self, selector: Selector("allowToContinue:"), userInfo: nil, repeats: false)
                    }
                    
                }
            }
        
        //self.performSelector(Selector("checkEnd"), withObject: self, afterDelay: 1)
//        let arr = [ended, win]
//        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("checkEnd:"), userInfo: arr, repeats: false)
        }
    }
    
    func allowToContinue(timer: NSTimer) {
        done = true;
    }
    
    func updateText(timer: NSTimer) {
        let text = timer.userInfo as! String
        infoText.string = infoText.string + text
    }
    
    func heroAnimation(timer: NSTimer) {
        let heroAbility = timer.userInfo as! Ability
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
        if (heroAbility.abilityType != "Defense") {
            spriteEnemy.animationManager.runAnimationsForSequenceNamed("injured")
        }
    }
    
    func enemyAnimation(timer: NSTimer) {
        let enemyAbility = timer.userInfo as! Ability
        switch (enemyAbility.abilityType) {
        case "Melee":
            if (enemy.kittyType == "Ninja") {
                spriteEnemy.animationManager.runAnimationsForSequenceNamed("katanaAttackReverse");
            } else {
                spriteEnemy.animationManager.runAnimationsForSequenceNamed("cutlassAttackReverse")
            }
            break
        case "Ranged":
            if (enemy.kittyType == "Ninja") {
                spriteEnemy.animationManager.runAnimationsForSequenceNamed("shurikenAttackReverse");
            } else {
                spriteEnemy.animationManager.runAnimationsForSequenceNamed("gunAttackReverse")
            }
            break
        default :
            break
        }
        if (enemyAbility.abilityType != "Defense") {
            spriteHero.animationManager.runAnimationsForSequenceNamed("injured")
        }
    }
    
    func endBattle(timer: NSTimer) {
        let win = timer.userInfo as! Bool
        hero.sprite.removeFromParent()
        enemy.sprite.removeFromParent()
        abilities.removeAllChildren()
        if (win) {
            hero.win()
            print("win")
            spriteEnemy.animationManager.runAnimationsForSequenceNamed("dying")
            spriteHero.animationManager.runAnimationsForSequenceNamed("dying")
            myRootRef.childByAppendingPath("piratesKillCount").observeSingleEventOfType(.Value, withBlock: {
                snapshot in
                myRootRef.childByAppendingPath("piratesKillCount").setValue(snapshot.value as! Int + 1)
            })
        } else {
            hero.lose()
            print("lose")
            spriteHero.animationManager.runAnimationsForSequenceNamed("dying")
        }
        if (hero.kittyType == "Ninja") {
            enemy = PirateKitty(name: "Pirate", sprite: CCBReader.load("PirateKitty") as! CCSprite)
            //
//            func resetStats() {
//                baseHP = 150.0
//                attack = 1.0
//                defense = 0.08
//                level = 1
//                xp = 0
//                amtKills = 0
//            }
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
        }
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
    }
    
    func getRanged() {
        if (done) {
            abilities.removeAllChildren()
            let map = hero.displayRangedAbilities()
            var index = 0.0
            for ability in map.values {
                let button = CCButton(title: ability.name)
                button.name = ability.name
                button.positionType = CCPositionTypeNormalized
                button.position.x = 0.50
                button.position.y = CGFloat(Float(0.80 - (0.30 * index)))
                button.setTarget(self, selector: "useAbility:")
                abilities.addChild(button)
                index = index + 1.0
            }
        }
    }
    
    func getMelee() {
        if (done) {
            abilities.removeAllChildren()
            let map = hero.displayMeleeAbilities()
            var index = 0.0
            for ability in map.values {
                let button = CCButton(title: ability.name)
                button.positionType = CCPositionTypeNormalized
                button.position.x = 0.50
                button.position.y = CGFloat(Float(0.80 - (0.30 * index)))
                button.setTarget(self, selector: "useAbility:")
                abilities.addChild(button)
                index = index + 1.0
            }
        }
    }
    
    func getDefense() {
        if (done) {
            abilities.removeAllChildren()
            let map = hero.displayDefenseAbilities()
            var index = 0.0
            for ability in map.values {
                let button = CCButton(title: ability.name)
                button.positionType = CCPositionTypeNormalized
                button.position.x = 0.50
                button.position.y = CGFloat(Float(0.80 - (0.30 * index)))
                button.setTarget(self, selector: "useAbility:")
                abilities.addChild(button)
                index = index + 1.0
            }
        }
    }
}
