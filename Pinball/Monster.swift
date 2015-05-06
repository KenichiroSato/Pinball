//
//  Monster.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Monster : SKSpriteNode{
    
    static private let RESTITUTION: CGFloat = 1.3
    
    init(texture:SKTexture, position:CGPoint) {
        super.init(texture: texture, color:UIColor.whiteColor(),  size: texture.size())
        self.physicsBody = SKPhysicsBody(texture: texture, size: self.size)
        self.physicsBody?.restitution = Monster.RESTITUTION
        self.physicsBody?.dynamic = false
        self.physicsBody?.contactTestBitMask = 1
        self.position = position
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScaleAnimation() {
        let scaleA = SKAction.scaleTo(0.5, duration: 0.5)
        let scaleB = SKAction.scaleTo(1.0, duration: 1.5)
        let scaleSequence = SKAction.sequence([scaleA, scaleB])
        let scaleRepeatAction = SKAction.repeatActionForever(scaleSequence)
        self.runAction(scaleRepeatAction)
    }
    
    func setMoveAnimation() {
        let moveA = SKAction.moveTo(CGPoint(x: 100, y: 300), duration: 1)
        let moveB = SKAction.moveTo(CGPoint(x: 200, y: 300), duration: 1)
        let scaleSequence = SKAction.sequence([moveA, moveB])
        let scaleRepeatAction = SKAction.repeatActionForever(scaleSequence)
        self.runAction(scaleRepeatAction)
    }
    
    func setRotateAnimation() {
        let rotate = SKAction.rotateByAngle(CGFloat(360*M_PI/180), duration: 3)
        let rotateRepeat = SKAction.repeatActionForever(rotate)
        self.runAction(rotateRepeat)
    }
    
    func setParaParaAnimation() {
        // must be overritten by subClass
    }
    
}

