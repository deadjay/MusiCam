//
//  RecordInteractor.swift
//  MusiCam
//
//  Created by Artem Alekseev on 9/2/19.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation
import AVFoundation

protocol RecordInteractorProtocol: class {
	var recordManager: RecordManager? { get set }

	func startRecordSession()
	func resumeRecordSession()
	func finishRecordSession()
}

class RecordInteractor: RecordInteractorProtocol {
	var recordManager: RecordManager?
	var presenter: RecordPresenterProtocol?

	func startRecordSession() {
		let session = AVCaptureSession()
		presenter?.recordSession = session
		recordManager = RecordManager(with: session)
		recordManager?.startSession()
	}

	func resumeRecordSession() {
		recordManager?.resumeSession()
	}

	func finishRecordSession() {
		recordManager?.finishSession()
	}
}
