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
    @NSManaged public var detailViewModel: NSOrderedSet?

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

// MARK: Generated accessors for detailViewModel
extension ViewModel {

    @objc(insertObject:inDetailViewModelAtIndex:)
    @NSManaged public func insertIntoDetailViewModel(_ value: DetailViewModel, at idx: Int)

    @objc(removeObjectFromDetailViewModelAtIndex:)
    @NSManaged public func removeFromDetailViewModel(at idx: Int)

    @objc(insertDetailViewModel:atIndexes:)
    @NSManaged public func insertIntoDetailViewModel(_ values: [DetailViewModel], at indexes: NSIndexSet)

    @objc(removeDetailViewModelAtIndexes:)
    @NSManaged public func removeFromDetailViewModel(at indexes: NSIndexSet)

    @objc(replaceObjectInDetailViewModelAtIndex:withObject:)
    @NSManaged public func replaceDetailViewModel(at idx: Int, with value: DetailViewModel)

    @objc(replaceDetailViewModelAtIndexes:withDetailViewModel:)
    @NSManaged public func replaceDetailViewModel(at indexes: NSIndexSet, with values: [DetailViewModel])

    @objc(addDetailViewModelObject:)
    @NSManaged public func addToDetailViewModel(_ value: DetailViewModel)

    @objc(removeDetailViewModelObject:)
    @NSManaged public func removeFromDetailViewModel(_ value: DetailViewModel)

    @objc(addDetailViewModel:)
    @NSManaged public func addToDetailViewModel(_ values: NSOrderedSet)

    @objc(removeDetailViewModel:)
    @NSManaged public func removeFromDetailViewModel(_ values: NSOrderedSet)

}
