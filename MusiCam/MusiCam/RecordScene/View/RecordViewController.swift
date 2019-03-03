//
//  RecordViewController.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import UIKit

protocol RecordViewProtocol: class {	
	func displayProgress()
	func startTimer()
	func stopTimer()
}

class RecordViewController: UIViewController {
	
	// MARK: - Properties
	
	weak var presenter: RecordPresenterProtocol?
	
	// MARK: - Private Properties
	
	private var recordView: MainRecordView = .fromNib()
	
	// MARK: - ViewController Lifecycle
	
	override func loadView() {
		view = recordView
		recordView.delegate = presenter
	}
	
}

extension RecordViewController: RecordViewProtocol {
	func displayProgress() {
		
	}
	
	func startTimer() {
		recordView.timerLabel.text = ""
	}
	
	func stopTimer() {
		recordView.timerLabel.text = "00:00"
	}
	
}
