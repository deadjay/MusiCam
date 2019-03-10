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
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
	var session: AVCaptureSession? { get set }
}

class RecordPresenter {
	weak var view: RecordViewProtocol?
	
	// MARK: - Private Properties
	
	private var recordManager: RecordManager?
	
	init() {
		guard let aSession = session else {
			return
		}
		recordManager = RecordManager(with: aSession)
	}
	
}


extension RecordPresenter: RecordPresenterProtocol {
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
