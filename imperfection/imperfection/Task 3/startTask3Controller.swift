//
//  startTask3Controller.swift
//  imperfection
//
//  Created by GWC2 on 8/1/19.
//  Copyright © 2019 GWC. All rights reserved.
//
//
//  startTask2Controller.swift
//  imperfection
//
//  Created by GWC2 on 7/31/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class startTask3Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene2(fileNamed: "GameScene2"){
                scene.viewController = self
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
            }
            
            view.ignoresSiblingOrder = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
