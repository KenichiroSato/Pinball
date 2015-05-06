//
//  GameScene.swift
//  Pinball
//
//  Created by 佐藤健一朗 on 2015/05/06.
//  Copyright (c) 2015年 Kenichiro Sato. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var isGameover = false
    
    var point:NSInteger = 0
    
    let gameoverLabel = SKLabelNode(fontNamed: "Hiragino Kaku Gothic ProN")
    
    let pointLabel = SKLabelNode(fontNamed: "Hiragino Kaku Gothic ProN")
    
    var ball = SKSpriteNode(imageNamed:"ball")
    var arms : Arms!
    var back = SKSpriteNode(imageNamed: "back")
    //var wallLeft = SKSpriteNode(imageNamed: "wallleft")
    //var wallRight = SKSpriteNode(imageNamed: "wallright")
    var triangleRight = SKSpriteNode(imageNamed: "triangleright")
    var triangleLeft = SKSpriteNode(imageNamed: "triangleleft")
    var monster1 = SKSpriteNode(imageNamed: "monster1a")
    var monster2 = SKSpriteNode(imageNamed: "monster2a")
    var monster3 = SKSpriteNode(imageNamed: "monster3a")
    let playSound = SKAction.playSoundFileNamed("click.mp3", waitForCompletion: false)

    
    override func didMoveToView(view: SKView) {
        setupPhysics()
        setupBackground()
        setupArms()
        makeBall()
    }
    
    private func setupPhysics() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -3.0)
        self.physicsWorld.contactDelegate = self
    }
    
    private func setupBackground() {
        back.position = CGPoint(x:0, y:0)
        back.anchorPoint = CGPoint(x: 0, y: 0)
        self.addChild(back)
        
        let rightWall = Wall(texture: Wall.RIGHT_TEXTURE, position: CGPoint(x: 240, y: 284))
        self.addChild(rightWall)
        let leftWall = Wall(texture: Wall.LEFT_TEXTURE, position: CGPoint(x: 80, y: 284))
        self.addChild(leftWall)
    }
    
    private func setupArms() {
        arms = Arms()
        arms.addArms(self)
    }
    
    private func makeBall() {
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.contactTestBitMask = 1
        ball.position = CGPoint(x: 225, y: 500)
        self.addChild(ball)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            arms.upArms()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            arms.downArms()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
    }
}
