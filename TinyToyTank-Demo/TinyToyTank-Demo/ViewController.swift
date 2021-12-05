//
//  ViewController.swift
//  TinyToyTank-Demo
//
//  Created by Karan Bhatia on 25/11/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    //Variables
    var isActionPlaying: Bool = false
    var tankAnchor : TinyToyTank._TinyToyTank?
    
    //Outlet's
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var turretLeftButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    @IBOutlet weak var turretRightButton: UIButton!
    
    @IBOutlet var arView: ARView!
    
    //Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor?.cannon?.setParent(tankAnchor?.tank,preservingWorldTransform: true)
        
        tankAnchor?.actions.actionComplete.onAction = {
            _ in self.isActionPlaying = false
        }
    
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor!)
        
    }
    
    override func viewDidLayoutSubviews() {
        setupUI()
    }
    
    
    //Actions
    @IBAction func actionLeft(_ sender: UIButton) {
        tankAnchor?.notifications.tankLeft.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }
    
    @IBAction func actionForward(_ sender: UIButton) {
        tankAnchor?.notifications.tankForward.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }
    
    @IBAction func actionRight(_ sender: UIButton) {
        tankAnchor?.notifications.tankRight.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }
    
    @IBAction func actionTurretLeft(_ sender: UIButton) {
        tankAnchor?.notifications.turretLeft.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }
    
    @IBAction func actionFire(_ sender: UIButton) {
        tankAnchor?.notifications.cannonFire.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }
    
    @IBAction func actionTurretRight(_ sender: UIButton) {
        tankAnchor?.notifications.turretRight.post()
        if self.isActionPlaying { return }
       else { self.isActionPlaying = true }
    }

    
    //Func
    func setupUI(){
        rightButton.button()
        leftButton.button()
        forwardButton.button()
        turretLeftButton.button()
        turretRightButton.button()
        fireButton.button()
    }
}


//Button Extension
extension UIButton{
    func button(){
        self.layer.cornerRadius = 4
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
}
