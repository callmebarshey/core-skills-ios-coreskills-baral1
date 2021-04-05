//
//  AccelerometerViewController.swift
//  Core Skills
//
//  Created by Gratch on 3/11/20.
//  Copyright © 2020 Jonathan Gratch. All rights reserved.
//
//  Assignment Notes: To make this simpler and to not have
//  to deal with UI updates, your code in startAccel should
//  only update the xDir, yDir, and zDir Double values whenever
//  the accelerometer changes.  checkDeviceRotation will copy
//  the current values of the variables to the labels when
//  called.

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    
    // NOTE: This can only really be tested on a device, not the simulator!
    
    lazy var motionManager = CMMotionManager()
    var xDir: Double!
    var yDir: Double!
    var zDir: Double!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @IBAction func startAccel(sender: UIButton) {
        // Add your code here
        
        if self.motion.isAccelerometerAvailable {
              self.motion.accelerometerUpdateInterval = 1.0 / 60.0
              self.motion.startAccelerometerUpdates()

              // Configure a timer to fetch the data.
              self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                    repeats: true, block: { (timer) in
                 // Get the accelerometer data.
                 if let data = self.motion.accelerometerData {
                    let x = data.acceleration.x
                    let y = data.acceleration.y
                    let z = data.acceleration.z

                    // Use the accelerometer data in your app.
                 }
              })
        
        } }
    
    @IBAction func checkDeviceRotation(sender: UIButton) {
        // Helper function to update the screen.  No edits needed.
        xLabel.text = "X = " + String(xDir)
        yLabel.text = "Y = " + String(yDir)
        zLabel.text = "Z = " + String(zDir)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
