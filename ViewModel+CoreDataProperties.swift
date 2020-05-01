//
//  ViewModel+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
//

import Foundation
import CoreData


extension ViewModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ViewModel> {
        return NSFetchRequest<ViewModel>(entityName: "ViewModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var thing: NSOrderedSet?

}

// MARK: Generated accessors for thing
extension ViewModel {

    @objc(insertObject:inThingAtIndex:)
    @NSManaged public func insertIntoThing(_ value: Thing, at idx: Int)

    @objc(removeObjectFromThingAtIndex:)
    @NSManaged public func removeFromThing(at idx: Int)

    @objc(insertThing:atIndexes:)
    @NSManaged public func insertIntoThing(_ values: [Thing], at indexes: NSIndexSet)

    @objc(removeThingAtIndexes:)
    @NSManaged public func removeFromThing(at indexes: NSIndexSet)

    @objc(replaceObjectInThingAtIndex:withObject:)
    @NSManaged public func replaceThing(at idx: Int, with value: Thing)

    @objc(replaceThingAtIndexes:withThing:)
    @NSManaged public func replaceThing(at indexes: NSIndexSet, with values: [Thing])

    @objc(addThingObject:)
    @NSManaged public func addToThing(_ value: Thing)

    @objc(removeThingObject:)
    @NSManaged public func removeFromThing(_ value: Thing)

    @objc(addThing:)
    @NSManaged public func addToThing(_ values: NSOrderedSet)

    @objc(removeThing:)
    @NSManaged public func removeFromThing(_ values: NSOrderedSet)

}
