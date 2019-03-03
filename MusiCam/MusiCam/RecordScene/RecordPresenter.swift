//
//  RecordPresenter.swift
//  MusiCam
//
//  Created by Artem Alekseev on 24/02/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation

protocol RecordPresenterProtocol: class {
	func recordButtonDidTap()
	func switchCameraButtonDidTap()
	func flashButtonDidTap()
}

class RecordPresenter {
	weak var view: RecordViewProtocol?
	
}

extension RecordPresenter: RecordPresenterProtocol {
	func recordButtonDidTap() {
		
	}
	
	func switchCameraButtonDidTap() {
		
	}
	
	func flashButtonDidTap() {
		
	}
}
