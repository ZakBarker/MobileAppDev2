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
                    Color(hue: 0, saturation: 0, brightness: 0).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        Text(dvm.notes).font(.largeTitle)
                            .fontWeight(.bold).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -60)
                        TextField(dvm.notesPlaceholder, text: $thing.notes).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField(dvm.imagePlaceholder, text: $thing.imageURL, onCommit: {self.thing.imageFromUrl(self.thing.imageURL)}).offset(y: -70).textFieldStyle(RoundedBorderTextFieldStyle())
                        // Image is displayed by calling wave method which returns an Image type.
                        thing.displayImageDetail().resizable().aspectRatio(contentMode: .fit).frame(width: 370.0).border(Color(hue: 0.584, saturation: 0.889, brightness: 0.504), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).offset(y: -70)
                        TextField(dvm.namePlaceholder, text: $thing.name)
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        TextField(dvm.likePlaceholder + "\n", text: $thing.like)
                            .font(.title)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -70)
                        HStack {
                            Text(dvm.type)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.typePlaceholder, text: $thing.type)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                        }
                        HStack {
                            Text(dvm.purpose)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.purposePlaceholder, text: $thing.purpose)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
        
                        }
                        HStack {
                            Text(dvm.description)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.trailing).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                            TextField(dvm.descriptionPlaceholder, text: $thing.description)
                                .multilineTextAlignment(.leading).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.9)).offset(y: -80)
                        }
                    }
                    .padding(.all, 50.0)
                }
    }
}

