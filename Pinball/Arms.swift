//
//  Arms.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import Foundation
import SpriteKit

public class Arms {
    
    static private let ACTION_DURATION = 0.05
    
    static private let ACTION_ANGLE = CGFloat(M_PI*0.25)
    
    let rightArm : SKSpriteNode!
    let leftArm : SKSpriteNode!
    
    init() {
        rightArm = Arm(texture: Arm.RIGHT_TEXTURE, position:Arm.RIGHT_POSITION)
        leftArm = Arm(texture: Arm.LEFT_TEXTURE, position: Arm.LEFT_POSITION)
    }
    
    func addArms(parent:SKNode) {
        parent.addChild(rightArm)
        parent.addChild(leftArm)
    }
    
    func upArms() {
        let actionRight = SKAction.rotateByAngle(-Arms.ACTION_ANGLE,
            duration: Arms.ACTION_DURATION)
        rightArm.runAction(actionRight)
        let actionLeft = SKAction.rotateByAngle(Arms.ACTION_ANGLE,
            duration: Arms.ACTION_DURATION)
        leftArm.runAction(actionLeft)
    }
    
    func downArms() {
        let actionRight = SKAction.rotateByAngle(Arms.ACTION_ANGLE,
            duration: Arms.ACTION_DURATION)
        rightArm.runAction(actionRight)
        let actionLeft = SKAction.rotateByAngle(-Arms.ACTION_ANGLE,
            duration: Arms.ACTION_DURATION)
        leftArm.runAction(actionLeft)
    }
}