//
//  ViewModels+ViewModels.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import CoreData
import Foundation

// Extension of ViewModels Class created by CoreData. Getters and setters translate Objective C Types to Swift friendly Types and vice-versa
extension ViewModels {
    /// Variable stores a title after drawing object from Database
    var titleStr: String {
        get { title ?? "" }
        set { title = newValue }
    }
    /// Variable stores a list of Things after drawing object from Database
    var properThing: [Thing] {
        get { thing?.array as? [Thing] ?? [] }
        set { thing = NSOrderedSet(array: newValue)}
    }
    
}
