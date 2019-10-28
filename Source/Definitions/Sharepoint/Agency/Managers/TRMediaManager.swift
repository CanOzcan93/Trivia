//
//  TRMediaManager.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

//import Foundation
import UIKit
//import AVFoundation

//open class TRMediaManager: NSObject, AVCapturePhotoCaptureDelegate {
open class TRMediaManager: NSObject {

//    // MARK: Camera Variables
//    private var captureDeviceCamera: AVCaptureDevice!
//    private var backCamera: AVCaptureDevice!
//    private var frontCamera: AVCaptureDevice!
//
//    private var captureSession: AVCaptureSession!
//    private var imageInput: AVCaptureDeviceInput!
//    private var imageOutput: AVCapturePhotoOutput!
//
//    public var videoPreviewLayer: AVCaptureVideoPreviewLayer!
//    public var captureImage: UIImage!
//
//    // MARK: Audio Variables
//    private var audioSession:AVAudioSession!
//
//    public var aqPlayer: AQPlayer!

    public required override init() {
        super.init()
    }

//    // MARK: Initialization of Camera Functions
//
//    private func tryGetBackCamera() -> Bool {
//        guard let initializedBackCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back) else {
//            print("Unable to access back camera!")
//            return false
//        }
//        backCamera = initializedBackCamera
//        return true
//    }
//
//
//    private func tryGetFrontCamera() -> Bool {
//        guard let initializedFrontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front) else {
//            print("Unable to access front camera!")
//            return false
//        }
//        frontCamera = initializedFrontCamera
//        return true
//    }
//
//
//    /*
//     -
//     -
//     // MARK: Create Preview Layer Function
//     -
//     -
//     */
//
//    public func turnOnCaptureSessionAndCreatePreviewLayer(compound: TRView) {
//
//        guard captureSession != nil else {
//            captureSession = AVCaptureSession()
//            captureSession.sessionPreset = .photo
//
//            getOrTurnCamera()
//            createImageOutput {
//                self.addCameraPreviewLayerToView(compound: compound)
//            }
//            return
//        }
//
//        turnOnCaptureSession()
//        createImageOutput {
//            self.addCameraPreviewLayerToView(compound: compound)
//        }
//    }
//
//
//    // MARK: Capture Session Quitting
//
//    public func turnOnCaptureSession() {
//        if captureSession != nil && !captureSession.isRunning {
//            captureSession.startRunning()
//        }
//    }
//
//    public func turnOffCaptureSession() {
//        if captureSession != nil && captureSession.isRunning {
//            captureSession.stopRunning()
//        }
//    }
//
//
//    /*
//     -
//     -
//     // MARK: Switch Between Cameras
//     -
//     -
//     */
//
//    public func getOrTurnCamera() {
//
//        if let definedCaptureDeviceCamera = captureDeviceCamera {
//            if definedCaptureDeviceCamera == frontCamera {
//                guard let definedBackCamera = backCamera else {
//                    guard tryGetBackCamera() else {
//                        print("Not getting back camera")
//                        return
//                    }
//                    captureDeviceCamera = backCamera
//                    return
//                }
//                captureDeviceCamera = definedBackCamera
//
//            }
//            else {
//                if definedCaptureDeviceCamera == backCamera {
//                    guard let definedFrontCamera = frontCamera else {
//                        guard tryGetFrontCamera() else {
//                            print("Not getting front camera")
//                            return
//                        }
//                        captureDeviceCamera = frontCamera
//                        return
//                    }
//                    captureDeviceCamera = definedFrontCamera
//                }
//            }
//
//        } else {
//            guard let definedFrontCamera = frontCamera else {
//                guard tryGetFrontCamera() else {
//                    print("Unable to access front camera!")
//                    return
//                }
//                captureDeviceCamera = frontCamera
//                return
//            }
//            captureDeviceCamera = definedFrontCamera
//        }
//    }
//
//    public func updateImageInput() {
//        do {
//            captureSession.removeInput(imageInput)
//            imageInput = try AVCaptureDeviceInput(device: captureDeviceCamera)
//            if captureSession.canAddInput(imageInput) {
//                captureSession.addInput(imageInput)
//            }
//        }
//        catch let error {
//            print("Error Unable to update Image Input:  \(error.localizedDescription)")
//        }
//    }
//
//
//    private func createImageOutput(setupLivePreview: @escaping Action) {
//        do {
//            imageInput = try AVCaptureDeviceInput(device: captureDeviceCamera)
//
//            imageOutput = AVCapturePhotoOutput()
//
//            if captureSession.canAddInput(imageInput) && captureSession.canAddOutput(imageOutput) {
//                captureSession.addInput(imageInput)
//                captureSession.addOutput(imageOutput)
//                setupLivePreview()
//            }
//        }
//        catch let error {
//            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
//        }
//    }
//
//    private func addCameraPreviewLayerToView (compound: TRView) {
//        compound.layer.sublayers = []
//
//        if videoPreviewLayer == nil {
//            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//            videoPreviewLayer.videoGravity = .resizeAspectFill
//            videoPreviewLayer.connection?.videoOrientation = .portrait
//        }
//
//
//        compound.layer.addSublayer(videoPreviewLayer)
//
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.captureSession.startRunning()
//            DispatchQueue.main.async {
//                self.videoPreviewLayer.frame = compound.layer.bounds
//            }
//        }
//
//    }
//
//    public func shootPhoto(completition: @escaping (UIImage)->()) {
//        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
//        self.imageOutput.capturePhoto(with: settings, delegate: self)
//        DispatchQueue.global(qos: .background).async {
//            while (self.captureImage==nil) {
//
//            }
//            DispatchQueue.main.async {
//                completition(self.captureImage)
//            }
//        }
//    }
//
//    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        guard let imageData = photo.fileDataRepresentation() else {
//            return
//        }
//
//        let image = UIImage(data: imageData)
//        self.captureImage = self.cropImageToSquare(image: image!)
//    }
//
//    private func cropImageToSquare(image: UIImage) -> UIImage? {
//        var imageHeight = image.size.height
//        var imageWidth = image.size.width
//
//        if imageHeight > imageWidth {
//            imageHeight = imageWidth
//        }
//        else {
//            imageWidth = imageHeight
//        }
//
//        let size = CGSize(width: imageWidth, height: imageHeight)
//
//        let refWidth : CGFloat = CGFloat(image.cgImage!.width)
//        let refHeight : CGFloat = CGFloat(image.cgImage!.height)
//
//        let x = (refWidth - size.width) / 2
//        let y = (refHeight - size.height) / 2
//
//        let cropRect = CGRect(x: x, y: y, width: size.height, height: size.width)
//        if let imageRef = image.cgImage!.cropping(to: cropRect) {
//            return UIImage(cgImage: imageRef, scale: 0, orientation: image.imageOrientation)
//        }
//
//        return nil
//    }
}
