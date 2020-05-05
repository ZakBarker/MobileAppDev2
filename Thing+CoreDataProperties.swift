//
//  Thing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zak Barker on 4/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
//

import Foundation
import CoreData


extension Thing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thing> {
        return NSFetchRequest<Thing>(entityName: "Thing")
    }
    /// Description of Thing
    @NSManaged public var descript: String?
    /// Description Label of Thing
    @NSManaged public var descriptField: String?
    /// Dynamic Image Url of Thing
    @NSManaged public var dynamicImage: String?
    /// Use Image Url Binding of Thing
    @NSManaged public var imageURL: String?
    /// Why the user likes the Thing
    @NSManaged public var like: String?
    /// Name of Thing
    @NSManaged public var name: String?
    /// Notes on Thing
    @NSManaged public var notes: String?
    /// Notes Label of Thing
    @NSManaged public var notesField: String?
    /// Purpose of Thing
    @NSManaged public var purpose: String?
    /// Purpose Label of Thing
    @NSManaged public var purposeField: String?
    /// Static Image Url of Thing
    @NSManaged public var staticImage: String?
    /// Type of Thing
    @NSManaged public var type: String?
    /// Type Label of Thing
    @NSManaged public var typeField: String?
    /// ViewModel Instance which of Thing belongs to
    @NSManaged public var viewModels: ViewModels?
}
