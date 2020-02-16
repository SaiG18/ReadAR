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
import Alamofire

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    var treeNode: SCNNode?
    var sceneView: ARSCNView!
    var count: Double = 0
    
    struct Root: Codable {
        let ocr: [Ocr]
        let imageUrls: [String]
    }
    
    struct Ocr: Codable {
        let h: Int
        let line: String
        let w: Int
        let x: Int
        let y: Int
    }
    
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

            print("x: \(p.x) y: \(p.y)") // <--- THIS IS WHERE I PRINT THE COORDINATES
            
            // Render text
            
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
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
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
    
    func Post(imageOrVideo : UIImage?) {
        let renderObject: Root
        let headers: HTTPHeaders = [
            /* "Authorization": "your_access_token",  in case you need authorization header */
            "Content-type": "multipart/form-data"
        ]
            AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(imageOrVideo!.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "file.jpeg", mimeType: "image/jpeg")
            },
                to: "http://140.238.147.73:8080/api", method: .post , headers: headers)
                .response { resp in
                    print(resp)
                    
                    self.count+=0.001
                    let object = try? self.decode(data: resp.data!)
                    object?.ocr.forEach { ocr in
                        let objectText = ocr.line
                        print(objectText)
                        let text = SCNText(string: objectText, extrusionDepth: 2)
                        let customFont = UIFont(name: "Dyslexie", size: UIFont.systemFontSize)

                        text.font = customFont
                        let textNode = SCNNode()
                        textNode.position = SCNVector3(Float(0+self.count), 0, Float(-0.2))
                        let cameraNode = self.sceneView.pointOfView
                        self.updatePositionAndOrientationOf(textNode, withPosition: textNode.position, relativeTo: cameraNode!)
                        textNode.scale = SCNVector3(0.001, 0.001, 0.001)
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
                        self.sceneView.scene.rootNode.addChildNode(textNode)
                        self.sceneView.autoenablesDefaultLighting = true
                    }
                    
                }
        }
    
    func updatePositionAndOrientationOf(_ node: SCNNode, withPosition position: SCNVector3, relativeTo referenceNode: SCNNode) {
        let referenceNodeTransform = matrix_float4x4(referenceNode.transform)

        // Setup a translation matrix with the desired position
        var translationMatrix = matrix_identity_float4x4
        translationMatrix.columns.3.x = position.x
        translationMatrix.columns.3.y = position.y
        translationMatrix.columns.3.z = position.z

        // Combine the configured translation matrix with the referenceNode's transform to get the desired position AND orientation
        let updatedTransform = matrix_multiply(referenceNodeTransform, translationMatrix)
        node.transform = SCNMatrix4(updatedTransform)
    }
    
    func decode(data: Data) throws -> Root? {
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(Root.self, from: data)
            return object
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func dataToJSON(data: Data) -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }
    
    fileprivate func apiCall(_ frame: ARFrame) {
        let imageBuffer: CVPixelBuffer = frame.capturedImage
        let ciimage : CIImage = CIImage(cvPixelBuffer: imageBuffer)
        
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(ciimage, from: ciimage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        
        Post(imageOrVideo: image)
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let randomFloat = Float.random(in: 0..<6)
        
        if (randomFloat > 0 && randomFloat < 0.025) {
            print("Called the api!!")
            apiCall(frame)
        }
    }
}
