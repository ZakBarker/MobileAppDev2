//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation

/// Class contains an array which stores data objects of the type Thing. This will be used to provide details to each view.
class ViewModel: ObservableObject, Identifiable, Codable{
    /// Stores Title of App
    @Published var title: String
    /// Stores data objects of type Thing
    @Published var things: [Thing] = []
        /// Stores data objects of type DetailViewModel
    @Published var detailViewModel: [DetailViewModel] = []
    
    /// - Parameters:
    ///     - title: Stores Title of App
    ///     - things: Stores data objects of type Thing
    ///     - detailViewModel: Stores data objects of type DetailViewModel
    
    init(title: String = "Favourite Things"){
        self.title = title
    }
    
//    required init(from decoder: Decoder) throws {
//        
//    }
//    
//    func encode(to encoder:Encoder) throws {
//        
//    }
    
    /// Function appends new thing to things array
    func addThing(){
        self.things.append(Thing(name: "quack", like: "quack quack", type: "quack quack quack", purpose: "quack quack", description: "quack quack quack quack", staticImage: "duck"))
    }
    
    /// Function removes thing from things array
    func removeThing(_ indices: IndexSet){
        indices.forEach { things.remove(at: $0) }
    }
    
}
