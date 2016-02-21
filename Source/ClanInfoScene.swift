//
//  ClanInfoScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation

class ClanInfoScene: CCNode {
    
    
    func goToBattle() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("PreviewBattleScene"))
    }
    
    func goToCharacter() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
    }
}
