//
//  RecordManager.swift
//  MusiCam
//
//  Created by Artem Alekseev on 10/03/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation
import AVFoundation

class RecordManager {
	
	// MARK: - Private Properties
	
	private var captureSession: AVCaptureSession
	
	// MARK: - Construction
	
	init(with captureSession: AVCaptureSession) {
		self.captureSession = captureSession
		
		configureSession()
	}
	
	// MARK: - Private Functions
	
	private func configureSession() {
		captureSession.beginConfiguration()
		guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified),
			let audioDevice = AVCaptureDevice.default(for: .audio) else {
				return
		}
		
		addInput(for: videoDevice)
		addInput(for: audioDevice)
		
		
	}
	
	private func addInput(for device: AVCaptureDevice) {
		var deviceInput: AVCaptureDeviceInput?
		
		do {
			deviceInput = try AVCaptureDeviceInput(device: device)
		} catch let error {
			print("Device input error = \(error)")
		}
		
		guard let aDeviceInput = deviceInput else {
			return
		}

		captureSession.addInput(aDeviceInput)
	}
	
}
