//
//  UIView+UINib.swift
//  MusiCam
//
//  Created by Artem Alekseev on 03/03/2019.
//  Copyright © 2019 Artem Alekseev. All rights reserved.
//

import UIKit

extension UIView {
	class func fromNib<T: UIView>() -> T {
		return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as? T ?? T()
	}
}
