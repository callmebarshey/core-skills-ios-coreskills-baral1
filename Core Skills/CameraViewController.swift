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
        if let photoOutputConnection = self.photoOutput.connection(with: .video) {
            photoOutputConnection.videoOrientation = videoPreviewLayerOrientation!
        }
        
        var photoSettings = AVCapturePhotoSettings()

        // Capture HEIF photos when supported. Enable auto-flash and high-resolution photos.
        if  self.photoOutput.availablePhotoCodecTypes.contains(.hevc) {
            photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
        }

        if self.videoDeviceInput.device.isFlashAvailable {
            photoSettings.flashMode = .auto
        }

        photoSettings.isHighResolutionPhotoEnabled = true
        if !photoSettings.__availablePreviewPhotoPixelFormatTypes.isEmpty {
            photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: photoSettings.__availablePreviewPhotoPixelFormatTypes.first!]
        }
        // Live Photo capture is not supported in movie mode.
        if self.livePhotoMode == .on && self.photoOutput.isLivePhotoCaptureSupported {
            let livePhotoMovieFileName = NSUUID().uuidString
            let livePhotoMovieFilePath = (NSTemporaryDirectory() as NSString).appendingPathComponent((livePhotoMovieFileName as NSString).appendingPathExtension("mov")!)
            photoSettings.livePhotoMovieFileURL = URL(fileURLWithPath: livePhotoMovieFilePath)
        }

        photoSettings.isDepthDataDeliveryEnabled = (self.depthDataDeliveryMode == .on
            && self.photoOutput.isDepthDataDeliveryEnabled)

        photoSettings.isPortraitEffectsMatteDeliveryEnabled = (self.portraitEffectsMatteDeliveryMode == .on
            && self.photoOutput.isPortraitEffectsMatteDeliveryEnabled)
        
        if photoSettings.isDepthDataDeliveryEnabled {
            if !self.photoOutput.availableSemanticSegmentationMatteTypes.isEmpty {
                photoSettings.enabledSemanticSegmentationMatteTypes = self.selectedSemanticSegmentationMatteTypes
            }
        }

        photoSettings.photoQualityPrioritization = self.photoQualityPrioritizationMode
    }

    @IBAction func useImageLibrary(_ sender: AnyObject) {
       
        // Add your code here
        PHPhotoLibrary.requestAuthorization { status in
                guard status == .authorized else { return }
                
                PHPhotoLibrary.shared().performChanges({
                    // Add the captured photo's file data as the main resource for the Photos asset.
                    let creationRequest = PHAssetCreationRequest.forAsset()
                    creationRequest.addResource(with: .photo, data: photo.fileDataRepresentation()!, options: nil)
                }, completionHandler: self.handlePhotoLibraryError)
            }
        
        
    }
    
    // You can add more functions here if needed
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}

