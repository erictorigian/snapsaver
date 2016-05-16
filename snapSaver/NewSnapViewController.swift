//
//  NewSnapViewController.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/13/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//

import CoreData
import UIKit

class NewSnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var snapName: UITextField!
	@IBOutlet weak var snapDetails: UITextField!
	@IBOutlet weak var snapTags: UITextField!
	@IBOutlet weak var snapImage: UIImageView!
	@IBOutlet weak var addSnapButton: UIButton!
	
	var imagePicker: UIImagePickerController!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		snapImage.layer.cornerRadius = 4.0
		snapImage.clipsToBounds = true
		
		
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
		imagePicker.dismissViewControllerAnimated(true, completion: nil)
		snapImage.image = image
	}
	
	
	@IBAction func addImage(sender: AnyObject) {
		presentViewController(imagePicker, animated: true, completion: nil)
		
	}
	
	@IBAction func createSnap(sender: AnyObject) {
		if let name = snapName.text where name != "" {
			let app = UIApplication.sharedApplication().delegate as! AppDelegate
			let context = app.managedObjectContext
			let entity = NSEntityDescription.entityForName("Snap", inManagedObjectContext: context)!
			
			let snap = Snap(entity: entity, insertIntoManagedObjectContext: context)
			snap.name = name
			snap.details = snapDetails.text
			snap.tags = snapTags.text
			snap.setSnapImage(snapImage.image!)
			
			context.insertObject(snap)
			
			do {
				try context.save()
			} catch {
				print("could not save snap")
			}
			
			self.navigationController?.popViewControllerAnimated(true)
		}
	}

}
