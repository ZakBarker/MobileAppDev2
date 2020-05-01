//
//  Thing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
//

import Foundation
import CoreData


extension Thing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thing> {
        return NSFetchRequest<Thing>(entityName: "Thing")
    }

    @NSManaged public var name: String?
    @NSManaged public var like: String?
    @NSManaged public var type: String?
    @NSManaged public var purpose: String?
    @NSManaged public var descript: String?
    @NSManaged public var staticImage: String?
    @NSManaged public var dynamicImage: String?
    @NSManaged public var notes: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var descriptField: String?
    @NSManaged public var typeField: String?
    @NSManaged public var notesField: String?
    @NSManaged public var purposeField: String?
    @NSManaged public var viewModel: ViewModel?

}