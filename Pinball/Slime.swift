//
//  Slime.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Slime : Monster {
    
    static private let NAME = "slime"
    
    static private let IMAGE_NAME_A = "monster3a"
    
    static private let IMAGE_NAME_B = "monster3b"
    
    static private let POSITION = CGPoint(x: 160, y: 200)
    
    init() {
        super.init(texture: SKTexture(imageNamed: Slime.IMAGE_NAME_A),
            position: Slime.POSITION)
        self.name = Slime.NAME
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setParaParaAnimation() {
        let textures = [SKTexture(imageNamed: Slime.IMAGE_NAME_A),
            SKTexture(imageNamed: Slime.IMAGE_NAME_B)]
        let action = SKAction.animateWithTextures(textures, timePerFrame: 0.5)
        let repeatAction = SKAction.repeatActionForever(action)
        self.runAction(repeatAction)
    }
}