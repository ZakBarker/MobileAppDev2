//
//  Thing+ViewModels.swift
//  FavouriteThings
//
//  Created by Zak Barker on 1/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//
import CoreData
import Foundation
import UIKit
import SwiftUI

// Extension of Thing Class created by CoreData. Getters and setters translate Objective C Types to Swift friendly Types and vice-versa
extension Thing {
    /// Variable stores a name after drawing object from Database
    var nameStr: String {
        get { name ?? "" }
        set { name = newValue }
    }
    /// Variable stores information for like field after drawing object from Database
    var likeStr: String {
       get { like ?? "" }
       set { like = newValue }
   }
    /// Variable stores type information after drawing object from Database
    var typeStr: String {
           get { type ?? "" }
           set { type = newValue }
       }
    /// Variable stores purpose after drawing object from Database
    var purposeStr: String {
           get { purpose ?? "" }
           set { purpose = newValue }
       }
    /// Variable stores a description after drawing object from Database
    var descriptStr: String {
           get { descript ?? "" }
           set { descript = newValue }
       }
    /// Variable stores a Static Image after drawing object from Database
    var staticImageStr: String {
           get { staticImage ?? "" }
           set { staticImage = newValue }
       }
    /// Variable stores a Dynamic Image Url after drawing object from Database
    var dynamicImageStr: String {
           get { dynamicImage ?? "" }
           set { dynamicImage = newValue }
       }
    /// Variable stores a note after drawing object from Database
    var notesStr: String {
           get { notes ?? "" }
           set { notes = newValue }
       }
    /// Variable stores an Image Url after drawing object from Database
    var imageURLStr: String {
           get { imageURL ?? "" }
           set { imageURL = newValue }
       }
    /// Variable stores a Description Field after drawing object from Database
    var descriptFieldStr: String {
           get { descriptField ?? "" }
           set { descriptField = newValue }
       }
    /// Variable stores a Type Field after drawing object from Database
    var typeFieldStr: String {
           get { typeField ?? "" }
           set { typeField = newValue }
       }
    /// Variable stores a Note Field after drawing object from Database
    var notesFieldStr: String {
           get { notesField ?? "" }
           set { notesField = newValue }
       }
    /// Variable stores a Purpose Field after drawing object from Database
    var purposeFieldStr: String {
           get { purposeField ?? "" }
           set { purposeField = newValue }
       }
    
    /// - Parameters:
    ///     - thing: Instance of type Thing
    /// - Remark: Function Populates New Instances with data
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
        thing.descriptField = "Description:"
        thing.typeField = "Type:"
        thing.notesField = "Notes:"
        thing.purposeField = "Purpose:"
    }   
}
