//
//  ViewController.swift
//  Particles3
//
//  Created by Denys Zahorskyi on 04.12.2022.
//

import SpriteKit
import UIKit

class SnowScene: SKScene {
    override func sceneDidLoad() {
        backgroundColor = .darkGray
        
        if let particles = SKEmitterNode(fileNamed: "snow") {
            particles.position.y = 600
            particles.position.x = 200
            addChild(particles)
        }
    }
}

class SparkScene: SKScene {
    override func sceneDidLoad() {
        backgroundColor = .darkGray
        
        if let particles = SKEmitterNode(fileNamed: "spark") {
            particles.position.y = 600
            particles.position.x = 200
            addChild(particles)
        }
        
    }
}

class FireScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if let particles = SKEmitterNode(fileNamed: "fire") {
                particles.position.y = location.y
                particles.position.x = location.x
                addChild(particles)
            }
        }
    }
    
    override func sceneDidLoad() {
        backgroundColor = .darkGray

    }
}


class SnowParticlesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as? SKView {
            let scene = SnowScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = false
            
            view.presentScene(scene)
        }
    }
}

class FireParticlesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            let scene = FireScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = false
            
            view.presentScene(scene)
        }
    }
}

class SparkParticlesViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            let scene = SparkScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = false
            
            view.presentScene(scene)
        }
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
