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
    var dvm: DetailViewModel
    var body: some View {
                ZStack{
                    Color(hue: 0.584, saturation: 0.889, brightness: 0.504).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        Text(dvm.notes).font(.largeTitle)
                            .fontWeight(.bold).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -60)
                        TextField(dvm.notesPlaceholder, text: $wave.notes).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField(dvm.imagePlaceholder, text: $wave.imageURL, onCommit: {self.wave.imageFromUrl(self.wave.imageURL)}).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        // Image is displayed by calling wave method which returns an Image type.
                        wave.displayImageDetail().resizable().aspectRatio(contentMode: .fit).frame(width: 370.0).border(Color(hue: 0.584, saturation: 0.889, brightness: 0.504), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).offset(y: -70)
                        TextField(dvm.namePlaceholder, text: $wave.name)
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        TextField(dvm.countryPlaceholder + "\n", text: $wave.country)
                            .font(.title)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        HStack {
                            Text(dvm.type)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.typePlaceholder, text: $wave.type)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                        }
                        HStack {
                            Text(dvm.left)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.leftPlaceholder, text: $wave.left)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
        
                        }
                        HStack {
                            Text(dvm.right)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.rightPlaceholder, text: $wave.right)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                        }
                    }
                    .padding(.all, 50.0)
                }
    }
}

