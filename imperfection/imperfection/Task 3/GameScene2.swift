//
//  GameScene2.swift
//  imperfection
//
//  Created by GWC2 on 7/31/19.
//  Copyright © 2019 GWC. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameScene2: SKScene {
    private var player: SKSpriteNode!
    private var title : SKSpriteNode!
    private var button: SKSpriteNode!
    
    var backgroundMusic: SKAudioNode!
    var box: SKSpriteNode!
    var grass: SKSpriteNode!
    var viewController: UIViewController!
    var move:Bool = false
    
    
    override func didMove(to view: SKView) {
        if let musicURL = Bundle.main.url(forResource: "groundMusic", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        } else {
            print("could not load file")
        }
        createBG()
        createGrass()
        createPlayer()
        createOffice()
        createBox()
        
    }
    
    func didBegin() {
        let alert = UIAlertController(title: "Task", message: "You were devastated that your boss had fired you for speaking up.. But again you weren't surprised. You needed to find a job soon before you go bankrupt, you remembered that a small doctor's office had opened up recently, so you decided to go see if they were hiring.", preferredStyle: .alert)
        let confirmBtn = UIAlertAction(title: "Next", style: .default, handler: {_ in self.returnToMainMenu()})
        alert.addAction(confirmBtn)
        self.viewController?.present(alert, animated: true, completion: nil)
        move = true
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let point = touch.location(in: self.view)
            player.position.x = point.x - 350
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if player.position.x >= 205 && player.position.x <= 270 && !move{
            didBegin()
        }
        
    }
    
    func createBG(){
        let BGTexture = SKTexture(imageNamed:"sky")
        for i in 0...1 {
            let bg = SKSpriteNode(texture: BGTexture)
            bg.zPosition = -30
            bg.position = CGPoint(x: (BGTexture.size().width * CGFloat(i)), y: 0)
            addChild(bg)
            let moveLeft = SKAction.moveBy(x: -BGTexture.size().width, y: 0, duration: 20)
            let moveReset = SKAction.moveBy(x: BGTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            
            bg.run(moveForever)
        }
    }
    
    func createGrass(){
        let GTexture = SKTexture(imageNamed:"ground")
        grass = SKSpriteNode(texture: GTexture)
        grass.size = CGSize(width: frame.width, height: 100)
        grass.zPosition = -20
        grass.position = CGPoint(x: 0, y: -138)
        addChild(grass)
    }
    
    func createPlayer(){
        let playerTexture = SKTexture(imageNamed:"girl1")
        player = SKSpriteNode(texture: playerTexture)
        player.size = CGSize(width: 200, height: 200)
        player.zPosition = 10
        player.position = CGPoint(x: -250, y:-50)
        addChild(player)
        //Setup the animation of the sprite so it looks like it's running
        let frame2 = SKTexture(imageNamed: "girl3")
        let animation = SKAction.animate(with: [player.texture!, frame2],   timePerFrame: 0.2)
        let runForever = SKAction.repeatForever(animation)
        
        //Run the SKActions on the player sprite
        player.run(runForever)
        
    }
    func createOffice(){
        let HTexture = SKTexture(imageNamed:"hos")
        let h = SKSpriteNode(texture: HTexture)
        h.size = CGSize(width: 550, height: 550)
        h.zPosition = -15
        h.position = CGPoint(x:frame.midX - 20, y: frame.midY + 50 )
        addChild(h)
    }

    func createBox(){
        let BTexture = SKTexture(imageNamed:"box")
        box = SKSpriteNode(texture: BTexture)
        box.size = CGSize(width: 64, height: 64)
        box.zPosition = -10
        box.position = CGPoint(x: frame.midX + 250, y: frame.midY )
        addChild(box)
    }
    
    func returnToMainMenu(){
        self.viewController.performSegue(withIdentifier: "doctor", sender: viewController)
        backgroundMusic.removeFromParent()
    }
}
