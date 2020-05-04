//
//  ViewModels+ViewModels.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import CoreData
import Foundation

extension ViewModels {
    var titleStr: String {
        get { title ?? "" }
        set { title = newValue }
    }
    var properThing: [Thing] {
        get { thing?.array as? [Thing] ?? [] }
        set { thing = NSOrderedSet(array: newValue)}
    }
    
    func newThing(thing: Thing){
        thing.name = "Quack"
        thing.like = "Quack Quack"
        thing.type = "Quack Quack Quack Quack"
        thing.purpose = "Quack Quack Quack"
        thing.descript = "Quack Quack"
        thing.staticImage = "duck"
        thing.dynamicImage = ""
        thing.notes = ""
        thing.imageURL = ""
        thing.descriptField = "Description"
        thing.typeField = "Type"
        thing.notesField = "Notes:"
        thing.purposeField = "Purpose:"
}

//    func moveThing(_ indices: IndexSet, destination){
//        self.properThing.move()
//    }
    
}
