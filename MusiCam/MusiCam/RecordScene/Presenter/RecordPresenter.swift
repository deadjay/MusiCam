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
	func startRecordSession()
	func resumeRecordSession()
	func finishRecordSession()
	
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
	
	var recordSession: AVCaptureSession? { get set }
}

class RecordPresenter {
	weak var view: RecordViewProtocol?
	
	// MARK: - Private Properties
	
	private var recordManager: RecordManager?
		
}


extension RecordPresenter: RecordPresenterProtocol {	
	func startRecordSession() {
		let session = AVCaptureSession()
		recordSession = session
		recordManager = RecordManager(with: session)
		recordManager?.startSession()
	}
	
	func resumeRecordSession() {
		recordManager?.resumeSession()
	}
	
	func finishRecordSession() {
		recordManager?.finishSession()
	}
		
	var recordSession: AVCaptureSession? {
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
