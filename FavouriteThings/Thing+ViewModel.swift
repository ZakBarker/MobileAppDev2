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
    var likeStr: String {
       get { like ?? "" }
       set { like = newValue }
   }
    var typeStr: String {
           get { type ?? "" }
           set { type = newValue }
       }
    var purposeStr: String {
           get { purpose ?? "" }
           set { purpose = newValue }
       }
    var descriptStr: String {
           get { descript ?? "" }
           set { descript = newValue }
       }
    var staticImageStr: String {
           get { staticImage ?? "" }
           set { staticImage = newValue }
       }
    var dynamicImageStr: String {
           get { dynamicImage ?? "" }
           set { dynamicImage = newValue }
       }
    var notesStr: String {
           get { notes ?? "" }
           set { notes = newValue }
       }
    var imageURLStr: String {
           get { imageURL ?? "" }
           set { imageURL = newValue }
       }
    var descriptFieldStr: String {
           get { descriptField ?? "" }
           set { descriptField = newValue }
       }
    var typeFieldStr: String {
           get { typeField ?? "" }
           set { typeField = newValue }
       }
    var notesFieldStr: String {
           get { notesField ?? "" }
           set { notesField = newValue }
       }
    var purposeFieldStr: String {
           get { purposeField ?? "" }
           set { purposeField = newValue }
       }

}
