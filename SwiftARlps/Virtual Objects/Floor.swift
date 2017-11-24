//
//  floor.swift
//  SwiftARlps
//
//  Created by Roman Tikhonychev on 11/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import SceneKit

class Floor: SCNNode, Positionable {
    var recentModelObjectDistances: [Float] = []
    
    let size: CGFloat = 0.7
    override init() {
        super.init()
        self.geometry = SCNBox(width: size, height: 0.001, length: size, chamferRadius: 0)
        // This positions this node's content on top of it's coordinate, so it's placed on top of a plane, instead of halfway through
        self.pivot = SCNMatrix4MakeTranslation(0, Float(-size/2), 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.gray
        material.lightingModel = .physicallyBased
        self.geometry?.materials = [material]
        let shape = SCNPhysicsShape(node: self, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .static, shape: shape)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

