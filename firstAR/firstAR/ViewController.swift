//
//  ViewController.swift
//  firstAR
//


import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
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

    // MARK: - ARSCNViewDelegate
    
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
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
    @IBOutlet weak var firstbutton: UIButton!
    
    @IBAction func firset(_ sender: Any) 
    {
        
        //let zCord = self.randomFloat(min : -0.2 , max : -2.0 )
        let geoM = SCNBox.init(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let node = SCNNode.init(geometry: geoM)
        let cc = self.getCameraCord(scenV : self.sceneView)
        
//        node.position = SCNVector3(0,0,zCord)
         node.position = SCNVector3(cc.x,cc.y,cc.z)
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }
    @IBAction func second(_ sender: Any) {
    }
    
    struct myCamCor
    {
    var x = Float()
    var y = Float()
    var z = Float()
    }
    
    func getCameraCord (scenV : ARSCNView) -> myCamCor
    {
        let t = sceneView.session.currentFrame?.camera.transform
        let camCor = MDLTransform(matrix: t!)
        var cc  = myCamCor()
        cc.x  = camCor.translation.x
        cc.y = camCor.translation.y
        cc.z = camCor.translation.z
        return cc
        
    }
    
}
