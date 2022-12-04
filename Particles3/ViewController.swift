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


class ParticlesViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var sceneType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            let scene: SKScene
            
            if sceneType == "fire" {
                scene = FireScene(size: view.bounds.size)
            } else if sceneType == "snow" {
                scene = SnowScene(size: view.bounds.size)
            } else if sceneType == "spark" {
                scene = SparkScene(size: view.bounds.size)
            } else {
                print (sceneType)
                fatalError()
            }
            
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
    
    
    
    @IBAction func snowTapped(_ sender: Any) {
        showVC(vcName: "snow")
    }
    
    
    @IBAction func sparkTapped(_ sender: Any) {
        showVC(vcName: "spark")
    }
    
    @IBAction func fireTapped(_ sender: Any) {
        showVC(vcName: "fire")
    }
    
    func showVC (vcName: String){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "particles")
        let particlesVC = vc as! ParticlesViewController
        particlesVC.sceneType = vcName
        navigationController?.pushViewController(particlesVC, animated: true)
    }
}

