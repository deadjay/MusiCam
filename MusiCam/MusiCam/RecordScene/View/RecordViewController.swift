//
//  RecordViewController.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import UIKit

protocol RecordViewProtocol: class {
	
}

class RecordViewController: UIViewController {
	
	// MARK: - Properties
	
	weak var presenter: RecordPresenterProtocol?
	
	// MARK: - ViewController Lifecycle
	
	override func loadView() {
		view = MainRecordView.fromNib()
	}
	
}

extension RecordViewController: RecordViewProtocol {
	
}
