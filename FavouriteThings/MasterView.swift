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

extension ViewModel {
    var properThing: [Thing] {
        thing?.array as? [Thing] ?? []
    }
}

struct MasterView: View {
    // View Model stores all information to be displayed in the View
    @ObservedObject var viewModel: ViewModel
    @Environment(\.editMode) var mode
    var body: some View {
        List {
            ForEach(viewModel.properThing, id: \.self) { thing in
                NavigationLink(destination: DetailView(thing: thing)) {
                    // Row View Stores functionality and UI instructions for each individual row
                    RowView(thing: thing)
                }
                // On deletion of Instance, call function which removes Instance of thing from Thing array in View Model
            }.onDelete { indices in
                self.viewModel.removeFromThing(at: indices as NSIndexSet)
            }
        }
    }
//    .navigationBarTitle(mode?.wrappedValue == .active ? "" : viewModel.title)
}
//}
//            }



//        VStack {
//            if mode?.wrappedValue == .active{
//                HStack {
//                    Text("📝  ").font(Font.system(.largeTitle).bold())
//                    TextField("Enter Title", text: $viewModel.title).font(Font.system(.largeTitle).bold())
//                }

//            .onMove { (indices, destination) in
//                self.viewModel.things.move(fromOffsets: indices, toOffset: destination)
//            }
