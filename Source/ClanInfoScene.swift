//
//  ClanInfoScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import Firebase

class ClanInfoScene: CCNode {
    
    weak var ninjaKills: CCLabelTTF!
    weak var pirateKills: CCLabelTTF!
    
    func didLoadFromCCB() {
        myRootRef.childByAppendingPath("ninjasKillCount").observeSingleEventOfType(.Value, withBlock: {
            snapshot in
            let ninjasKillCount = snapshot.value
            self.ninjaKills.string = String(ninjasKillCount)
            print(ninjasKillCount)
        })
        myRootRef.childByAppendingPath("piratesKillCount").observeSingleEventOfType(.Value, withBlock: {
            snapshot in
            let piratesKillCount = snapshot.value
            self.pirateKills.string = String(piratesKillCount)
            print(piratesKillCount)
        })
    }
    
    func goToLocationScene() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("LocationScene"))
    }
    
    func goToBattle() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("PreviewBattleScene"))
    }
    
    func goToCharacter() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("CharacterInfoScene"))
    }
}