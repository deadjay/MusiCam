//
//  MainRecordView.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import UIKit

protocol MainRecordViewDelegate: class {
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
}

class MainRecordView: UIView {
	
	// MARK: - Properties
	
	weak var delegate: RecordPresenterProtocol?
	
	// MARK: IBOutlets
		
	@IBOutlet weak var recordButton: UIButton!
	@IBOutlet weak var switchCameraButton: UIButton!
	@IBOutlet weak var flashButton: UIButton!
	@IBOutlet weak var timerLabel: UILabel!
	
	// MARK: - View Lifecycle
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}	
	
	// MARK: - Actions
	
	@IBAction func recordButtonDidTap(_ sender: UIButton) {
		delegate?.recordButtonDidTap()
	}
	
	@IBAction func switchCameraButtonDidTap(_ sender: Any) {
		delegate?.switchCameraButtonDidTap()
	}
	
	@IBAction func flashButtonDidTap(_ sender: Any) {
		delegate?.flashButtonDidTap()
	}
}
