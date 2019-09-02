//
//  RecordWireframe.swift
//  MusiCam
//
//  Created by Artem Alekseev on 03/03/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation

protocol RecordWireframeProtocol: class {
	static func buildRecordViewController() -> RecordViewController
}

class RecordWireframe: RecordWireframeProtocol {
	static func buildRecordViewController() -> RecordViewController {
		let presenter = RecordPresenter()
		let view = RecordViewController()
		presenter.view = view
		view.presenter = presenter
		
		return view
	}
}
