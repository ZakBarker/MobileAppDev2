//
//  DetailViewModel+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
//

import Foundation
import CoreData


extension DetailViewModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DetailViewModel> {
        return NSFetchRequest<DetailViewModel>(entityName: "DetailViewModel")
    }

    @NSManaged public var notes: String?
    @NSManaged public var notesPlaceholder: String?
    @NSManaged public var type: String?
    @NSManaged public var purpose: String?
    @NSManaged public var descript: String?
    @NSManaged public var namePlaceholder: String?
    @NSManaged public var likePlaceholder: String?
    @NSManaged public var typePlaceholder: String?
    @NSManaged public var purposePlaceholder: String?
    @NSManaged public var descriptPlaceholder: String?
    @NSManaged public var imagePlaceholder: String?
    @NSManaged public var viewModel: ViewModel?

}
