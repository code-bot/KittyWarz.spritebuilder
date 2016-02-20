//
//  StartScene.swift
//  KittyWarz
//
//  Created by Rahul Nambiar on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import UIKit

class StartScene: CCScene {
    
    var button: CCButton!
    var kitty: CCSprite!
    
    func didLoadFromCCB() {
        kitty.color = CCColor.redColor()
    }
    
    func nextScene() {
        CCDirector.sharedDirector().replaceScene(CCBReader.loadAsScene("MainScene"))
    }
    
}
