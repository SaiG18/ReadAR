//
//  ARViewController.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    let config = ARWorldTrackingConfiguration()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.session.delegate = self

        startARSession()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      // Prevent the screen from being dimmed to avoid interuppting the AR experience.
      // Doing this *will* cause the battery to be used up more quickly.
      UIApplication.shared.isIdleTimerDisabled = true

      startARSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      sceneView.session.pause()
    }
    
    func startARSession() {
      // Set up the AR configuration.
      config.worldAlignment = .gravityAndHeading

      // Start the AR session.
      sceneView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func restartExperience() {
      startARSession()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ARViewController: ARSessionDelegate {

  // MARK: - ARSessionDelegate
  // =========================

  func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {

  }

  func session(_ session: ARSession, didFailWithError error: Error) {
    guard error is ARError else { return }

    let errorWithInfo = error as NSError
    let messages = [
      errorWithInfo.localizedDescription,
      errorWithInfo.localizedFailureReason,
      errorWithInfo.localizedRecoverySuggestion
    ]

    // Use compactMap(_:) to remove optional error messages.
    let errorMessage = messages.compactMap({ $0 }).joined(separator: "\n")

    DispatchQueue.main.async {
      self.displayErrorMessage(title: "The AR session failed.", message: errorMessage)
    }
  }

  func sessionWasInterrupted(_ session: ARSession) {
  }

  func sessionInterruptionEnded(_ session: ARSession) {
    restartExperience()
  }

  func sessionShouldAttemptRelocalization(_ session: ARSession) -> Bool {
    return true
  }


  // MARK: - Error handling
  // ======================

  func displayErrorMessage(title: String, message: String) {
    // Blur the background.

    // Present an alert informing about the error that has occurred.
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
      alertController.dismiss(animated: true, completion: nil)
      self.startARSession()
    }
    alertController.addAction(restartAction)
    present(alertController, animated: true, completion: nil)
  }

}
