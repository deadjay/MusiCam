//
//  RecordManagerError.swift
//  MusiCam
//
//  Created by Artem Alekseev on 28/04/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import Foundation

enum RecordManagerError: Swift.Error {
	case deviceInputError
	case captureSessionIsMissing
	case inputsAreInvalid
	case invalidOperation
	case noCamerasAvailable
	case unknown
}
