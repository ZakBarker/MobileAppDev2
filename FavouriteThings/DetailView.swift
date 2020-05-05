//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI

// DetailView Receives instance of Class Thing. This instance stores all of the data for a specific thing and displays this data as GUI implementation specified.

struct DetailView: View {
    @Environment(\.managedObjectContext) var context
    // @ObservableObject variable created for the purpose of Binding with TextFields
    @ObservedObject var thing: Thing
    // ImageCache Used for display and storing of images
    @ObservedObject var imageCache: ImageCache
    var body: some View {
                ZStack{
                    Color(hue: 0, saturation: 0, brightness: 0).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        TextField("Notes", text: $thing.notesFieldStr).font(.largeTitle)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -60)
                        TextField("Add Notes Here", text: $thing.notesStr).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Insert image Url", text: $thing.imageURLStr, onCommit: { if self.imageCache.imageFromUrl(self.thing.imageURLStr) != "" {self.thing.dynamicImage = self.imageCache.imageFromUrl(self.thing.imageURLStr) }}).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
//                        // Image is displayed by calling thing method which returns an Image type.
                        imageCache.displayImageDetail(thing.dynamicImageStr, staticUrl: thing.staticImageStr).resizable().aspectRatio(contentMode: .fit).frame(width: 370.0).border(Color(hue: 0.584, saturation: 0.889, brightness: 0.504), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).offset(y: -70)
                        TextField("Insert Name", text: $thing.nameStr)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        TextField("What do you like about it" + "\n", text: $thing.likeStr)
                            .font(.system(size: 24, weight: .medium, design: .default))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -75)
                        HStack {
                            TextField("Type", text: $thing.typeFieldStr)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField("What sort of thing is this", text: $thing.typeStr)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                        }
                        HStack {
                            TextField("Purpose", text: $thing.purposeFieldStr)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField("What is its purpose", text: $thing.purposeStr)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)

                        }
                        HStack {
                            TextField("Description", text: $thing.descriptFieldStr)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField("Describe it", text: $thing.descriptStr)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                        }
                    }
                    .padding(.all, 50.0)
                }
    }
}
