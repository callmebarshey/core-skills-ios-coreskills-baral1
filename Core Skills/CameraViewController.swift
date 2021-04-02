//
//  CameraViewController.swift
//  Core Skills
//
//  Created by Gratch on 3/11/20.
//  Copyright © 2020 Jonathan Gratch. All rights reserved.
//
//
//  Assignment Notes: I suggest following the tutorial found at
// https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/avcam_building_a_camera_app

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var newMedia: Bool?
    
    @IBAction func useCamera(_ sender: AnyObject) {
        // Add your code here
    }
    
    @IBAction func useImageLibrary(_ sender: AnyObject) {
        // Add your code here
    }
    
    // You can add more functions here if needed
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}
