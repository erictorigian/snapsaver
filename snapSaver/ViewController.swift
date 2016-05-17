//
//  ViewController.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/12/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	//MARK: - IBOutlets and variables
	
	@IBOutlet weak var tableView: UITableView!
	
		
	//MARK: - View lifecycle functions
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		DataService.instance.fetchAndSetResults()
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedRowHeight = 121
		
	}
	
	//MARK: - Tableview functions
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return DataService.instance.snaps.count;
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		if let cell = tableView.dequeueReusableCellWithIdentifier("SnapCell") as? SnapCell {
			
			let snap = DataService.instance.snaps[indexPath.row]
			cell.configureCell(snap)
			return cell
		} else {
			return SnapCell()
		}
		
	}
	
	

}

