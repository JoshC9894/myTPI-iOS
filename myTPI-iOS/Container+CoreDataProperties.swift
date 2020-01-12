//
//  Container+CoreDataProperties.swift
//  Astron Group
//
//  Created by Joshua Colley on 16/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Container {

    @NSManaged var date1: String?
    @NSManaged var client: String?
    @NSManaged var id: String?
    @NSManaged var outcome: String?

}
