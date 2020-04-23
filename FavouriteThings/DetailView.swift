//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI

// DetailView Receives instance of Class Wave. This instance stores all of the data for a specific wave and displays this data as GUI implementation specifiec.

struct DetailView: View {
    // @ObservableObject variable created for the purpose of Binding with TextFields
    @ObservedObject var thing: Thing
    // dvm or Detail View Model stores all embedded text information. This includes placeholders and generic text which will be displayed on page.
    @ObservedObject var dvm: DetailViewModel
    var body: some View {
                ZStack{
                    Color(hue: 0, saturation: 0, brightness: 0).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        TextField("Notes", text: $dvm.notes).font(.largeTitle)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -60)
                        TextField(dvm.notesPlaceholder, text: $thing.notes).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField(dvm.imagePlaceholder, text: $thing.imageURL, onCommit: {self.thing.imageFromUrl(self.thing.imageURL)}).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        // Image is displayed by calling wave method which returns an Image type.
                        thing.displayImageDetail().resizable().aspectRatio(contentMode: .fit).frame(width: 370.0).border(Color(hue: 0.584, saturation: 0.889, brightness: 0.504), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).offset(y: -70)
                        TextField(dvm.namePlaceholder, text: $thing.name)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        TextField(dvm.likePlaceholder + "\n", text: $thing.like)
                            .font(.system(size: 24, weight: .medium, design: .default))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -75)
                        HStack {
                            TextField("Type", text: $dvm.type)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField(dvm.typePlaceholder, text: $thing.type)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                        }
                        HStack {
                            TextField("Purpose", text: $dvm.purpose)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField(dvm.purposePlaceholder, text: $thing.purpose)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
        
                        }
                        HStack {
                            TextField("Description", text: $dvm.description)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                                .font(.system(size: 18, weight: .heavy, design: .default))
                            TextField(dvm.descriptionPlaceholder, text: $thing.description)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(x: -60, y: -70)
                        }
                    }
                    .padding(.all, 50.0)
                }
    }
}
