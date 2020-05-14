//
//  MapView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 14/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MapView: View {
    @Environment(\.managedObjectContext) var context
    // Stores information for specific things for display
    @ObservedObject var thing: Thing
    // ImageCache Used for display and storing of images
    @State var currentPosition = CLLocationCoordinate2D(latitude: -22, longitude: -150)
    var body: some View {
        ZStack{
            Color(hue: 0, saturation: 0, brightness: 0).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {

                HStack {
                    Text("Location: ").foregroundColor(Color.white)
                    .offset(y:-75)
                    TextField("Location", text: $thing.locationNameStr, onCommit: thing.findLocation(thing: thing)
//                        {
//                        let geocoder = CLGeocoder()
//                        let region = CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
//                        geocoder.geocodeAddressString(self.thing.locationNameStr, in: region) {(placemarks, error) in
//                            guard let location = placemarks?.first?.location else {
//                                print ("Error location")
//                                return
//                            }
//                            let position = location.coordinate
//                            self.currentPosition.latitude = position.latitude
//                            self.currentPosition.longitude = position.longitude
//                            self.thing.locationXStr = "\(position.latitude)"
//                            self.thing.locationYStr = "\(position.longitude)"
//                        }
//                    }
                )
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -75)
                }
                HStack {
                    Text("Latitude: ").foregroundColor(Color.white)
                    .offset(y:-75)
                    TextField("Enter Latitude", text: $thing.locationXStr, onCommit: {
                        guard let latitude = CLLocationDegrees(self.thing.locationXStr),
                            let longitude = CLLocationDegrees(self.thing.locationYStr) else {
                                print("Invalid")
                                return
                        }
                        self.currentPosition.latitude = latitude
                        self.currentPosition.longitude = longitude
                        
                        let geoCoder = CLGeocoder()
                        let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                        geoCoder.reverseGeocodeLocation(position) { (placemarks, error) in
                            guard let placemark = placemarks?.first else {
                                print("Error Location")
                                return
                            }
                            self.thing.locationNameStr = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "Unknown"
                        }
                    })
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -75)
                }
                HStack {
                    Text("Longitude: ").foregroundColor(Color.white)
                    .offset(y:-75)
                    TextField("Enter Longitude", text: $thing.locationYStr, onCommit: {
                        guard let latitude = CLLocationDegrees(self.thing.locationXStr),
                            let longitude = CLLocationDegrees(self.thing.locationYStr) else {
                                print("Invalid")
                                return
                        }
                        self.currentPosition.latitude = latitude
                        self.currentPosition.longitude = longitude
                        
                        let geoCoder = CLGeocoder()
                        let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                        geoCoder.reverseGeocodeLocation(position) { (placemarks, error) in
                            guard let placemark = placemarks?.first else {
                                print("Error Location")
                                return
                            }
                            self.thing.locationNameStr = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "Unknown"
                        }
                    })
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -75)
                }
            }
            .padding(.all, 50.0)
        }
    }
}

