//
//  CharacterInfoScene.swift
//  KittyWarz
//
//  Created by Sahaj Bhatt on 2/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation

class CharacterInfoScene: CCNode {
    
    var test : CCLabelTTF!
    
    func didLoadFromCCB() {
        print(hero.name)
        test.string = hero.name
        
    }
    
}
