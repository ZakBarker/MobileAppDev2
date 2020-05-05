//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//


import SwiftUI
import CoreData
// ContentView receives View Model data structure from Scene Delegate.swift. It then creates a NavigationView which houses the MasterView and passes the View Model structure to the MasterView for processing. Also provides an Add New Thing Function to update Model with a UI event.

struct ContentView: View {
    // View Model stores all information to be displayed in the View
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ViewModels.title, ascending: true)], animation: .default) var viewModels: FetchedResults<ViewModels>
    // ImageCache Used for display and storing of images
    @ObservedObject var imageCache: ImageCache
//    var dumbModel: ViewModels
    var body: some View {
        NavigationView{
            MasterView(viewModels: viewModels.first ?? ViewModels(context: context), imageCache: imageCache)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                let thing = Thing(context: self.context)
                                thing.newThing(thing: thing)
                                thing.viewModels = self.viewModels.first
                            }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
        }
    }
}
