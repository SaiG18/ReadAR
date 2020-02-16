//
//  ViewController.swift
//  hackpack-arkit
//
//  Created by Olivia Brown on 1/20/18.
//  Copyright © 2018 TreeHacks. All rights reserved.
//
import UIKit
import SceneKit
import ARKit
class ViewController: UIViewController, ARSCNViewDelegate {
    var treeNode: SCNNode?
    var sceneView: ARSCNView!
    
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let sceneView = self.sceneView!
        
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        

        // check what nodes are tapped
        let p = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result: SCNHitTestResult = hitResults[0]

            print(result.node.name!)
            print("x: \(p.x) y: \(p.y)") // <--- THIS IS WHERE I PRINT THE COORDINATES
            
            // Render text
            let text = SCNText(string: "Dyslexia friendly term", extrusionDepth: 2)
            let customFont = UIFont(name: "Dyslexie", size: UIFont.systemFontSize)

            text.font = customFont
            let textNode = SCNNode()
            textNode.position = SCNVector3((result.node.position.x)-0.25*(textNode.boundingBox.min.x), (result.node.position.y), -2.0)
            textNode.scale = SCNVector3(0.01, 0.01, 0.01)
            textNode.geometry = text
            
            let minVec = textNode.boundingBox.min
            let maxVec = textNode.boundingBox.max
            let bound = SCNVector3Make(maxVec.x - minVec.x,
                                       maxVec.y - minVec.y,
                                       maxVec.z - minVec.z);

            let plane = SCNPlane(width: CGFloat(bound.x + 1),
                                height: CGFloat(bound.y + 1))
            plane.cornerRadius = 0.2
            plane.firstMaterial?.diffuse.contents = UIColor.blue.withAlphaComponent(0.9)

            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3(CGFloat( minVec.x) + CGFloat(bound.x) / 2 ,
                                            CGFloat( minVec.y) + CGFloat(bound.y) / 2,CGFloat(minVec.z + 0.01))

            textNode.addChildNode(planeNode)
            planeNode.name = "text"
            sceneView.scene.rootNode.addChildNode(textNode)
            sceneView.autoenablesDefaultLighting = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = ARSCNView()
        view.addSubview(sceneView)
        self.view.addSubview(sceneView)
        
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        sceneView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        sceneView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
                
        // Create a new scene
        let scene = SCNScene(named: "../art.scnassets/Dot.scn")!
        self.treeNode = scene.rootNode.childNode(withName: "sphere", recursively: true)
        self.treeNode?.position = SCNVector3Make(0, 0, -25)
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
