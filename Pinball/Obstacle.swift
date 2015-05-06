//
//  Obstacle.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Obstacle : SKSpriteNode{
    
    static let RIGHT_TEXTURE = SKTexture(imageNamed: "triangleright")
    
    static let LEFT_TEXTURE = SKTexture(imageNamed: "triangleleft")
    
    static let RIGHT_POSITION = CGPoint(x: 240, y: 150)

    static let LEFT_POSITION = CGPoint(x: 80, y: 150)
    
    static let RESTITUTION : CGFloat
    = 0.5

    init(texture:SKTexture, position:CGPoint) {
        super.init(texture: texture, color:UIColor.whiteColor(),  size: texture.size())
        self.physicsBody = SKPhysicsBody(texture: texture, size: self.size)
        self.physicsBody?.restitution = Obstacle.RESTITUTION
        self.physicsBody?.dynamic = false
        self.physicsBody?.contactTestBitMask = 1
        self.position = position
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
