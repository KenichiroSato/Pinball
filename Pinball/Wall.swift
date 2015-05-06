//
//  Wall.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Wall : SKSpriteNode{

    static let RIGHT_TEXTURE = SKTexture(imageNamed: "wallright")

    static let LEFT_TEXTURE = SKTexture(imageNamed: "wallleft")

    init(texture:SKTexture, position:CGPoint) {
        super.init(texture: texture, color:UIColor.whiteColor(),  size: texture.size())
        self.physicsBody = SKPhysicsBody(texture: texture, size: self.size)
        self.physicsBody?.restitution = 0.3
        self.physicsBody?.dynamic = false
        self.physicsBody?.contactTestBitMask = 1
        self.position = position
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
