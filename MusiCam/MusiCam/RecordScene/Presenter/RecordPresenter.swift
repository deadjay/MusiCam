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
	func viewDidLoad()
	func viewWillAppear()
	func finishRecordSession()
	
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
	
	var recordSession: AVCaptureSession? { get set }
}

class RecordPresenter: RecordPresenterProtocol {

	weak var view: RecordViewProtocol?

	// MARK: - Private Properties

	private var interactor: RecordInteractorProtocol?

	func viewDidLoad() {
		interactor?.startRecordSession()
	}
	
	func viewWillAppear() {
		interactor?.resumeRecordSession()
	}
	
	func finishRecordSession() {
		interactor?.finishRecordSession()
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
