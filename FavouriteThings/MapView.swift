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
    var body: some View {
        ZStack{
            Color(hue: 0, saturation: 0, brightness: 0).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Text("Location: ").foregroundColor(Color.white)
                        .offset(y:-50)
                    TextField("Location", text: $thing.locationNameStr)
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                HStack {
                    Text("Latitude: ").foregroundColor(Color.white)
                    .offset(y:-50)
                    TextField("Enter Latitude", text: $thing.latitudeStr)
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                HStack {
                    Text("Longitude: ").foregroundColor(Color.white)
                        .offset(y:-50)
                    TextField("Enter Longitude", text: $thing.longitudeStr)
                        .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                Button("Find Coordinates for Location Name"){
                    self.thing.findLocation()
                }
                Button("Find Location from Coordinates"){
                    self.thing.findCoordinates()
                }
                MapDisplayView(thing: thing)
            }
            .padding(.all, 50.0)
        }
    }
}

