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
    weak var scroll : CCNode!
    weak var menu : CCNode!
    
    func didLoadFromCCB() {
        print("add child")
        let spriteHero = hero.sprite
        let spriteEnemy = enemy.sprite
        spriteHero.scale = 0.002 * Float(self.contentSize.height)
        spriteEnemy.scale = 0.002 * Float(self.contentSize.height)
        you.addChild(spriteHero)
        opponent.addChild(spriteEnemy)
        yourLevel.string = String(hero.level)
        oppLevel.string = String(enemy.level)
        yourHP.string = String(hero.baseHP)
        oppHP.string = String(enemy.baseHP)
        
        
        print("hi")
    }
    
    //spriteHero.runAnimationSequenceNamed...
    func useAbility(sender: CCButton!) {
        print(sender)
        var map = hero.displayAbilities()
        let rand = Int(arc4random_uniform(UInt32(2)))
        var ended = false
        if (rand == 0) {
            print(enemy.name + " used " + enemy.enemyPerformAbility(hero))
            if (hero.currentHP <= 0) {
                yourHP.string = String(0)
                print("YOU LOSE")
                ended = true
            } else {
                yourHP.string = String(hero.currentHP)
                oppHP.string = String(enemy.currentHP)
                print(hero.name + " used " + hero.performAbility(map[sender.title]!, enemy: enemy))
                yourHP.string = String(hero.currentHP)
                if (enemy.currentHP <= 0) {
                    oppHP.string = String(0)
                    print("YOU WON")
                    ended = true
                } else {
                    oppHP.string = String(enemy.currentHP)
                }
            }
        } else {
            print(hero.name + " used " + hero.performAbility(map[sender.title]!, enemy: enemy))
            if (enemy.currentHP <= 0) {
                oppHP.string = String(0)
                print("YOU WON")
                ended = true
            } else {
                oppHP.string = String(enemy.currentHP)
                yourHP.string = String(hero.currentHP)
                print(enemy.name + " used " + enemy.enemyPerformAbility(hero))
                oppHP.string = String(enemy.currentHP)
                if (hero.currentHP <= 0) {
                    yourHP.string = String(0)
                    print("YOU LOSE")
                    ended = true
                } else {
                    yourHP.string = String(hero.currentHP)
                }
            }
            
        }
        if (ended) {
            
        }
        
    }
    
    func getRanged() {
        print("map")
        let map = hero.displayRangedAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.name = ability.name
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            scroll.addChild(button)
            index = index + 1.0
        }

        print("done")
    }
    
    func getMelee() {
        print("map")
        let map = hero.displayMeleeAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            scroll.addChild(button)
            index = index + 1.0
        }
//        scroll.removeFromParent()
//        let scrollView = CCScrollView(contentNode: scroll)
//        print("scrollview positioin stuff")
//        //scrollView.positionType = CCPositionTypeNormalized
//        scrollView.position.x = 20
//        scrollView.position.y = 4
//        //scrollView.contentSize.width = 0.79 //* menu.contentSize.width
//        //scrollView.contentSize.height = 0.92 //* menu.contentSize.height
//        print("add scrollview to menu")
//        menu.addChild(scrollView)
//        print(scrollView.position)
        print("done")
    }
    
    func getDefense() {
        print("map")
        let map = hero.displayDefenseAbilities()
        var index = 0.0
        for ability in map.values {
            let button = CCButton(title: ability.name)
            button.positionType = CCPositionTypeNormalized
            button.position.x = 0.50
            button.position.y = CGFloat(Float(0.90 - (0.20 * index)))
            button.setTarget(self, selector: "useAbility:")
            scroll.addChild(button)
            index = index + 1.0
        }
        print("done")
    }
}
