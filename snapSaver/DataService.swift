//
//  DataService.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/17/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataService {
	static let instance = DataService()
	
	var snaps = [Snap]()
	
	
	//MARK: - Coredata Functions
	
	func fetchAndSetResults() {
		let app = UIApplication.sharedApplication().delegate as! AppDelegate
		let context = app.managedObjectContext
		let fetchRequest = NSFetchRequest(entityName: "Snap")
		
		do {
			let results = try context.executeFetchRequest(fetchRequest)
			self.snaps = results as! [Snap]
		} catch let err as NSError {
			print(err.debugDescription)
		}
	}
}
