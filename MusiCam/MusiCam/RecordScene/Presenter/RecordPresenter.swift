//
//  RecordPresenter.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation
import AVFoundation

protocol RecordPresenterProtocol: class {
	func showPreview()
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
	var session: AVCaptureSession? { get set }
}

class RecordPresenter {
	weak var view: RecordViewProtocol?
	
	// MARK: - Private Properties
	
	private var recordManager: RecordManager?
	
	// MARK: - Private Functions
	
	private func setupRecordManager() {
		guard let aSession = session else {
			return
		}
		recordManager = RecordManager(with: aSession)
		recordManager?.startSession()
	}
}


extension RecordPresenter: RecordPresenterProtocol {
	func showPreview() {
		session = AVCaptureSession()
		setupRecordManager()
	}
	
	var session: AVCaptureSession? {
		get {
			return view?.videoPreviewLayer.session
		}
		set {
			view?.videoPreviewLayer.session = newValue
		}
	}
	
	func recordButtonDidTap() {
		
	}
	
	func switchCameraButtonDidTap() {
		
	}
	
	func flashButtonDidTap() {
		
	}
}
