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
                    TextField("Location", text: $thing.locationNameStr, onCommit: {  self.thing.findLocation() ;print("\(self.currentPosition) is here")})
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                HStack {
                    Text("Latitude: ").foregroundColor(Color.white)
                    .offset(y:-75)
                    TextField("Enter Latitude", text: $thing.locationXStr, onCommit: {self.currentPosition = self.thing.findCoordinates(position: self.currentPosition)})
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                HStack {
                    Text("Longitude: ").foregroundColor(Color.white)
                    .offset(y:-75)
                    TextField("Enter Longitude", text: $thing.locationYStr, onCommit: {  self.thing.findLocation() })
                    .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -50)
                }
                MapDisplayView(thing: thing)
            }
            .padding(.all, 50.0)
        }
    }
}

