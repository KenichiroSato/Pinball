//
//  Dragon.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Dragon : Monster {
    
    static private let NAME = "dragon"
    
    static private let IMAGE_NAME_A = "monster2a"
    
    static private let IMAGE_NAME_B = "monster2b"
    
    static private let POSITION = CGPoint(x: 100, y: 400)
    
    init() {
        super.init(texture: SKTexture(imageNamed: Dragon.IMAGE_NAME_A),
            position: Dragon.POSITION)
        self.name = Dragon.NAME
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setParaParaAnimation() {
        let textures = [SKTexture(imageNamed: Dragon.IMAGE_NAME_A),
            SKTexture(imageNamed: Dragon.IMAGE_NAME_B)]
        let action = SKAction.animateWithTextures(textures, timePerFrame: 0.5)
        let repeatAction = SKAction.repeatActionForever(action)
        self.runAction(repeatAction)
    }
}