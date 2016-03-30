//
//  Restaurant+CoreDataProperties.swift
//  foodpin
//
//  Created by 薛菁 on 16/3/17.
//  Copyright © 2016年 Jesse. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var location: String
    @NSManaged var rating: String?
    @NSManaged var isVisited: NSNumber
    @NSManaged var image: NSData?

}
