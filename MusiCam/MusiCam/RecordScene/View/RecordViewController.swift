//
//  RecordViewController.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import UIKit
import AVFoundation

protocol RecordViewProtocol: class {	
	func displayProgress()
	func startTimer()
	func stopTimer()
	var videoPreviewLayer: AVCaptureVideoPreviewLayer { get }
}

class RecordViewController: UIViewController {
	
	// MARK: - Properties
	
	var presenter: RecordPresenterProtocol?
	
	// MARK: - Private Properties
	
	private var recordView: MainRecordView = .fromNib()
	
	// MARK: - ViewController Lifecycle
	
	override func loadView() {
		view = recordView
		recordView.delegate = presenter
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		presenter?.startRecordSession()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		presenter?.resumeRecordSession()
	}
	
}

extension RecordViewController: RecordViewProtocol {
	var videoPreviewLayer: AVCaptureVideoPreviewLayer {
		guard let layer = recordView.layer as? AVCaptureVideoPreviewLayer else {
			fatalError("Expected `AVCaptureVideoPreviewLayer` type for layer. Check MainRecordView.layerClass implementation.")
		}
		
		return layer
	}
	
	func displayProgress() {
		
	}
	
	func startTimer() {
		recordView.timerLabel.text = ""
	}
	
	func stopTimer() {
		recordView.timerLabel.text = "00:00"
	}
	
}
