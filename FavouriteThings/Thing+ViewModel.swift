//
//  Thing+ViewModel.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
import CoreData
import Foundation

extension Thing {
    var nameStr: String {
        get { name ?? "" }
        set { name = newValue }
    }
//    var like: String?
//    var type: String?
//    var purpose: String?
//    var descript: String?
//    var staticImage: String?
//    var dynamicImage: String?
//    var notes: String?
//    var imageURL: String?
//    var descriptField: String?
//    var typeField: String?
//    var notesField: String?
//    var purposeField: String?
//    var viewModel: ViewModel?

}
