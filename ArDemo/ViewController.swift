//
//  ViewController.swift
//  ArDemo
//
//  Created by 金小鱼 on 2021/7/29.
//

import UIKit
import SwiftUI
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let arSession = ARSession()
    let configuration = ARWorldTrackingConfiguration()
    var nodeWeCanChage: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Up Our ARSession
        sceneView.session = arSession
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [SCNDebugOptions.showWireframe, SCNDebugOptions.showFeaturePoints, SCNDebugOptions.showCreases]
        
        // Create a new scene
        // let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set up plane detection
        configuration.planeDetection = .vertical
        
        // Set the scene to the view
        // sceneView.scene = scene
        arSession.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func createHostingController(for node: SCNNode) {
        // create a hosting controller with SwiftUI view
        let boardController = UIHostingController(rootView: Board())
        
        // Do this on the main thread
        DispatchQueue.main.async {
            boardController.willMove(toParent: self)
            // make the hosting VC a child to the main view controller
            self.addChild(boardController)
            
            // set the pixel size of the Card View
            boardController.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            
            // add the ar card view as a subview to the main view
            self.view.addSubview(boardController.view)
            
            // render the view on the plane geometry as a material
            self.show(hostingVC: boardController, on: node)
        }
    }

    func show(hostingVC: UIHostingController<Board>, on node: SCNNode) {
        // create a new material
        let material = SCNMaterial()
        
        // this allows the card to render transparent parts the right way
        hostingVC.view.isOpaque = false
        
        // set the diffuse of the material to the view of the Hosting View Controller
        material.diffuse.contents = hostingVC.view
        
        // Set the material to the geometry of the node (plane geometry)
        node.geometry?.materials = [material]
        
        hostingVC.view.backgroundColor = UIColor.clear
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if nodeWeCanChage == nil {
            // check we have detected an ARPlaneAnchor
            guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
            
            // get the size of the ARPlaneAnchor
            let width = CGFloat(planeAnchor.extent.x)
            let height = CGFloat(planeAnchor.extent.z)
            
            // create an SCNPlane which matches the size of ARPlaneAnchor
            let plane = SCNPlane(width: width, height: height)
            nodeWeCanChage = SCNNode(geometry: plane)
            createHostingController(for: nodeWeCanChage!)
            
            // rotate
            nodeWeCanChage?.eulerAngles.x = -.pi/2
            
            // add it to node & thus the hiearchy
            node.addChildNode(nodeWeCanChage!)
        }
    }
}
