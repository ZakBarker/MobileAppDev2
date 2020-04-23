//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation

/// Class contains an array which stores data objects of the type Wave. This will be used to provide details to each view.
class ViewModel: ObservableObject, Identifiable{
    /// Stores data objects of type Wave
    @Published var things: [Thing] = []
    @Published var detailViewModel: [DetailViewModel] = []
    
    /// - Parameters:
    ///     - things: Stores data objects of type Thing
    ///     - detailViewModel: Stores data objects of type DetailViewModel
    
    /// Function appends new wave to waves array
    func addThing(){
        self.things.append(Thing(name: "New", like: "Wave", type: "", purpose: "", description: "", staticImage: "snapper"))
    }
    
    /// Function removes wave from waves array
    func removeThing(_ indices: IndexSet){
        indices.forEach { thing.remove(at: $0) }
    }
    
}
