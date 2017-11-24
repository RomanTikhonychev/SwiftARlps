//
//  Ball.swift
//  SwiftARlps
//
//  Created by Roman Tikhonychev on 11/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import SceneKit

class Ball: SCNNode, Positionable {
    var recentModelObjectDistances: [Float] = []
    
    let size: CGFloat = 0.1
    override init() {
        super.init()
        self.geometry = SCNSphere(radius: size)
        
        // texture
        var materials: [SCNMaterial] = Array()
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "BallMaterial")
        material.shininess = 1.0
        materials.append(material)
        
        self.geometry?.materials = materials
        
        let shape = SCNPhysicsShape(geometry: self.geometry!, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
