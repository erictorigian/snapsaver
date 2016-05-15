//
//  Snap+CoreDataProperties.swift
//  snapSaver
//
//  Created by Eric Torigian on 5/14/16.
//  Copyright © 2016 Eric Torigian. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Snap {

    @NSManaged var image: NSData?
    @NSManaged var name: String?
    @NSManaged var details: String?
    @NSManaged var tags: String?

}
