//
//  ViewController.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/12/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	//MARK: - IBOutlets
	
	
	@IBOutlet weak var tableView: UITableView!
	
	var snaps = [Snap]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
        
    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		fetchAndSetResults()
		tableView.reloadData()
	}
	
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
	
	
	//MARK: - Tableview functions
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return snaps.count;
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		if let cell = tableView.dequeueReusableCellWithIdentifier("SnapCell") as? SnapCell {
			
			let snap = snaps[indexPath.row]
			cell.configureCell(snap)
			return cell
		} else {
			return SnapCell()
		}
		
	}


}

