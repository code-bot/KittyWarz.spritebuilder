//
//  CharacterInfoScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation

class CharacterInfoScene: CCNode {
    var sprite: CCNode!
    var test : CCLabelTTF!
    var test2 : CCLabelTTF!
    var test3 : CCLabelTTF!
    var test4 : CCLabelTTF!
    var test5 : CCLabelTTF!
    var test6 : CCLabelTTF!
    var test7 : CCLabelTTF!
    var test8 : CCLabelTTF!
    
    func didLoadFromCCB() {
        sprite.addChild(hero.sprite)
        test.string = hero.name
        test2.string = hero.kittyType
        test3.string = String(hero.baseHP)
        test4.string = String(hero.attack)
        test5.string = String(hero.defense)
        test6.string = String(hero.level)
        test7.string = String(hero.xp)
        test8.string = String(hero.amtKills)
    }
    
    func goToBattle() {
        hero.sprite.removeFromParent()
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("PreviewBattleScene"))
        
    }
    
    func goToClan() {
        hero.sprite.removeFromParent()
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("ClanInfoScene"))
        
    }
}
