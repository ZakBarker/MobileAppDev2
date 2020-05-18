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
import CoreLocation

// Extension of Thing Class created by CoreData. Getters and setters translate Objective C Types to Swift friendly Types and vice-versa
extension Thing{
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
    /// Variable stores a Location Name  after drawing object from Database
    var locationNameStr: String {
           get { locationName ?? "" }
           set { locationName = newValue }
       }
    /// Variable stores a Latitude after drawing object from Database
    var latitudeStr: String {
           get { locationX ?? "" }
           set { locationX = newValue }
       }
    /// Variable stores a Longitude after drawing object from Database
    var longitudeStr: String {
           get { locationY ?? "" }
           set { locationY = newValue }
       }
        
    /// - Parameters:
    ///     - thing: Instance of type Thing
    /// - Remark: Function Populates New Instances with data
    func newThing(thing: Thing){
        thing.name = ""
        thing.like = ""
        thing.type = ""
        thing.purpose = ""
        thing.descript = ""
        thing.staticImage = "duck"
        thing.dynamicImage = ""
        thing.notes = ""
        thing.imageURL = ""
        thing.descriptField = "Description:"
        thing.typeField = "Type:"
        thing.notesField = "Notes:"
        thing.purposeField = "Purpose:"
        thing.locationName = "New York"
        thing.locationX = "40.7"
        thing.locationY = "-74.007"
        thing.latitude = 40.7
        thing.longitude = -74.007
        thing.isUpdating = false
    }
    
    /// - Remark: Sets the Location of X and Y locations based on Location Name Input
    func findLocation() {
        let currentPosition = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        let geocoder = CLGeocoder()
        let region = CLCircularRegion(center: currentPosition, radius: 2_000_000, identifier: "\(currentPosition)")
        geocoder.geocodeAddressString(self.locationNameStr, in: region) {(placemarks, error) in
            guard let location = placemarks?.first?.location else {
                print ("Error location")
                return
            }
            let position = location.coordinate
            self.latitude = position.latitude
            self.longitude = position.longitude
            self.latitudeStr = "\(position.latitude)"
            self.longitudeStr = "\(position.longitude)"
        }
    }
    
    /// - Remark: Sets the Location Name based on the Latitude & Longitude inputs
    func findCoordinates(){
        if Double(self.latitudeStr) ?? 90 <= 89.99 && Double(self.latitudeStr) ?? 90 >= -89.99 && Double(self.longitudeStr) ?? 180 <= 179.99 && Double(self.longitudeStr) ?? 180 >= -179.99 {
            guard let latitude = CLLocationDegrees(self.latitudeStr),
                let longitude = CLLocationDegrees(self.longitudeStr) else {
                    print("Invalid")
                    return
            }
            self.latitude = latitude
            self.longitude = longitude
            
            let geoCoder = CLGeocoder()
            let position = CLLocation(latitude: self.latitude, longitude: self.longitude)
            geoCoder.reverseGeocodeLocation(position) { (placemarks, error) in
                guard let placemark = placemarks?.first else {
                    print("Error Location")
                    return
                }
                self.locationNameStr = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "Unknown"
            }
        }
        else {
            self.latitudeStr = "Sorry"
            self.longitudeStr = "Invalid Input"
            return
        }
    }
}
