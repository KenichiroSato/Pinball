//
//  Mushroom.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Mushroom : Monster {
    
    static private let NAME = "mushroom"
    
    static private let IMAGE_NAME_A = "monster1a"
    
    static private let IMAGE_NAME_B = "monster1b"
    
    static private let POSITION = CGPoint(x: 240, y: 260)
    
    init() {
        super.init(texture: SKTexture(imageNamed: Mushroom.IMAGE_NAME_A),
            position: Mushroom.POSITION)
        self.name = Mushroom.NAME
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setParaParaAnimation() {
        let textures = [SKTexture(imageNamed: Mushroom.IMAGE_NAME_A),
            SKTexture(imageNamed: Mushroom.IMAGE_NAME_B)]
        let action = SKAction.animateWithTextures(textures, timePerFrame: 0.5)
        let repeatAction = SKAction.repeatActionForever(action)
        self.runAction(repeatAction)
    }
}