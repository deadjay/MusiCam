//
//  RecordManager.swift
//  MusiCam
//
//  Created by Artem Alekseev on 10/03/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation
import AVFoundation

private enum SessionSetupResult {
	case success
	case notAuthorized
	case configurationFailed
}

class RecordManager {
	
	// MARK: - Private Properties
	
	private var captureSession: AVCaptureSession
	private let sessionQueue: DispatchQueue
	private var sessionSetupResult: SessionSetupResult
	
	private var defaultVideoDevice: AVCaptureDevice? {
		if let dualCameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .unspecified) {
			return dualCameraDevice
		} else if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
			return backCameraDevice
		} else if let frontCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
			return frontCameraDevice
		}
		
		return nil
	}
	
	// MARK: - Construction
	
	init(with captureSession: AVCaptureSession) {
		self.captureSession = captureSession	
		self.sessionQueue = DispatchQueue(label: "sessionQueue")
		self.sessionSetupResult = .notAuthorized
	}
	
	// MARK: - Functions
	
	func startSession() {
		checkDevicesAuthorizationStatus()
		
		sessionQueue.async {
			self.captureSession.startRunning()
			self.configureSession()
		}
	}
	
	func resumeSession() {
		
	}
	
	func finishSession() {
		
	}
	
	// MARK: - Private Functions
	
	private func checkDevicesAuthorizationStatus() {
		switch AVCaptureDevice.authorizationStatus(for: .video) {
		case .authorized:
			sessionSetupResult = .success
		case .notDetermined:
			sessionSetupResult = .configurationFailed
			sessionQueue.suspend()
		default:
			sessionSetupResult = .notAuthorized
		}
	}
	
	private func configureSession() {				
		guard let videoDevice = defaultVideoDevice,
			let audioDevice = AVCaptureDevice.default(for: .audio) else {
				return
		}
		
		captureSession.beginConfiguration()
		captureSession.sessionPreset = .high

		addInput(for: videoDevice)
		addInput(for: audioDevice)
		
		let videOutput = AVCaptureVideoDataOutput()
		let audioOutput = AVCaptureAudioDataOutput()
		
		add(videOutput)
		add(audioOutput)		
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
		captureSession.commitConfiguration()
	}
	
	private func add(_ output: AVCaptureOutput) {
		guard captureSession.canAddOutput(output) else {
			return
		}
		
		captureSession.addOutput(output)
		captureSession.commitConfiguration()
	}
}
