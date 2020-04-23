//
//  RowView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI

// Row View stores all UI instructions for each individual row. Each row corresponds to a single Thing which is recieved from the Master View

struct RowView: View {
    // Stores information for specific things for display
    @ObservedObject var thing: Thing
    var body: some View {
        HStack{
            // Called function which dynamically changes the display image based on input from Detail View.
            thing.displayImageRow().resizable().frame(width: 70, height: 50)
            VStack(alignment: .leading){
                Text(thing.name).bold()
                Text(thing.like)
                    .font(.footnote)
            }
        }
    }
}
