//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI
import CoreData

// MasterView receives View Model data structure from Content View. Masterview displays a list of NavigationLinks which correspond to each index within the things array. It then displays GUI and passes data for each indexed Thing instance to the DetailView.

struct MasterView: View {
    // View Model stores all information to be displayed in the View
    @Environment(\.managedObjectContext) var context
    @ObservedObject var viewModels: ViewModels
    @Environment(\.editMode) var mode
    @ObservedObject var imageCache: ImageCache
    var body: some View {
        VStack{
            if mode?.wrappedValue == .active{
                HStack {
                    Text("📝  ").font(Font.system(.largeTitle).bold())
                    TextField("Enter Title", text: $viewModels.titleStr).font(Font.system(.largeTitle).bold())
                }
            }
            List {
                ForEach(viewModels.properThing, id: \.self) { thing in
                    NavigationLink(destination: DetailView(thing: thing, imageCache: self.imageCache)) {
                        // Row View Stores functionality and UI instructions for each individual row
                        RowView(thing: thing, imageCache: self.imageCache)
                    }
                        // On deletion of Instance, call function which removes Instance of thing from Thing array in View Model
                    }.onDelete { indices in
                        self.viewModels.removeFromThing(at: indices as NSIndexSet)
                    }.onMove { (indices, destination) in
                        self.viewModels.properThing.move(fromOffsets: (indices as NSIndexSet) as IndexSet, toOffset: (destination))
                }
            }
        .navigationBarTitle(mode?.wrappedValue == .active ? "" : viewModels.titleStr)
        }
    }
}
