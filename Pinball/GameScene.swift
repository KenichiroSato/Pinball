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
    var mushroom : Monster!
    var dragon : Monster!
    var slime : Monster!
    let playSound = SKAction.playSoundFileNamed("click.mp3", waitForCompletion: false)

    
    override func didMoveToView(view: SKView) {
        setupPhysics()
        setupBackground()
        setupArms()
        setupMonsters()
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
        
        let rightObstacle = Obstacle(texture: Obstacle.RIGHT_TEXTURE,
            position: Obstacle.RIGHT_POSITION)
        self.addChild(rightObstacle)
        let leftObstacle = Obstacle(texture: Obstacle.LEFT_TEXTURE,
            position: Obstacle.LEFT_POSITION)
        self.addChild(leftObstacle)
    }
    
    private func setupArms() {
        arms = Arms()
        arms.addArms(self)
    }
    
    private func setupMonsters() {
        mushroom = Mushroom()
        self.addChild(mushroom)
        mushroom.setScaleAnimation()
        mushroom.setParaParaAnimation()
        
        dragon = Dragon()
        self.addChild(dragon)
        dragon.setMoveAnimation()
        dragon.setParaParaAnimation()
        
        slime = Slime()
        self.addChild(slime)
        slime.setRotateAnimation()
        slime.setParaParaAnimation()
    }
    
    private func makeBall() {
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.contactTestBitMask = 1
        ball.position = CGPoint(x: 135, y: 500)
        self.addChild(ball)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if let nodeA = contact.bodyA.node, nodeB = contact.bodyB.node {
            if (nodeA is Monster || nodeB is Monster) {
                ball.runAction(playSound)
                showParticle()
            }
        }
    }
    
    private func showParticle() {
        let particle = SKEmitterNode(fileNamed: "HitMonster.sks")
        self.addChild(particle)
        
        var removeAction = SKAction.removeFromParent()
        var durationAction = SKAction.waitForDuration(1)
        var sequence = SKAction.sequence([durationAction, removeAction])
        particle.runAction(sequence)
        
        particle.position = CGPoint(x: ball.position.x, y: ball.position.y)
        particle.alpha = 1
        
        var fadeAction = SKAction.fadeAlphaTo(0, duration: 0.5)
        particle.runAction(fadeAction)
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
