//
//  Snap.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/14/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Snap: NSManagedObject {

	func setSnapImage(img: UIImage) {
		let data = UIImagePNGRepresentation(img)
		self.image = data
	}


	func getSnapImg() -> UIImage {
		let img = UIImage(data: self.image!)!
		return img
	}
}
