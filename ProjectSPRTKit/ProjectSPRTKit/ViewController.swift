//
//  ViewController.swift
//  ProjectSPRTKit
//
//  Created by Алтын on 11/5/20.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    private let animationView = SKView()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .green
         
         self.view.addSubview(animationView)
         let scene = self.makeScene()
         animationView.frame.size = scene.size
         animationView.presentScene(scene)
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         
         animationView.center.x = self.view.bounds.midX
         animationView.center.y = self.view.bounds.midY
     }

     private func makeScene() -> SKScene {
         let dimension = min(view.frame.width, view.frame.height)
         let size = CGSize(width: dimension, height: dimension)
         let scene = SKScene(size: size)
         scene.backgroundColor = .white
         
         self.addNodes(to: scene)
         self.animateNodes(scene.children)
         
         return scene
     }
     
     private func addNodes(to scene: SKScene) {
         let items = ["A", "B", "C", "D"]
         let distance = floor(scene.size.width / CGFloat(items.count))
         
         for (index, element) in items.enumerated() {
             let node = SKLabelNode()
             node.render(element)
             node.position.y = floor(scene.size.height / 2)
             node.position.x = distance * (CGFloat(index) + 0.5)
             scene.addChild(node)
         }
     }
     
     private func animateNodes(_ nodes: [SKNode]) {
         for (index, node) in nodes.enumerated() {
             
             let delay = SKAction.wait(forDuration: TimeInterval(index) * 0.3)
             let up = SKAction.scale(to: 2, duration: 0.3)
             let down = SKAction.scale(to: 1, duration: 0.3)
             let wait = SKAction.wait(forDuration: 1)
             
             let sequence = SKAction.sequence([
                 up,
                 down,
                 wait
             ])
             
             let rotate = SKAction.rotate(byAngle: .pi * 2, duration: 0.6)
             
             let moveUp = SKAction.moveTo(y: node.position.y + 100, duration: 0.3)
             let moveDown = SKAction.moveTo(y: node.position.y - 100, duration: 0.3)
             let moveGroup = SKAction.sequence([
                 moveUp,
                 moveDown
             ])
             
             let group = SKAction.group([
                 sequence,
                 moveGroup,
                 rotate
             ])
             
             let repeatAction = SKAction.repeatForever(group)
             let finalSequence = SKAction.sequence([
                 delay,
                 repeatAction
             ])
             
             node.run(finalSequence)
         }
     }
 }

 extension SKLabelNode {
     
     func render(_ string: String) {
         fontSize = 50
         text = string
         fontColor = .black
         
         verticalAlignmentMode = .center
         horizontalAlignmentMode = .center
     }
     
 }
