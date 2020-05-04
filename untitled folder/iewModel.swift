//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation

/// Class contains an array which stores data objects of the type Thing. This will be used to provide details to each view.
class iewModel: ObservableObject, Identifiable, Codable{
    /// Stores Title of App
    @Published var title: String
    /// Stores data objects of type Thing
    @Published var things: [Thing] = []
        /// Stores data objects of type DetailViewModel
    @Published var detailViewModel: DetailViewModel
    
    /// - Parameters:
    ///     - title: Stores Title of App
    ///     - things: Stores data objects of type Thing
    ///     - detailViewModel: Stores data objects of type DetailViewModel
    
    init(title: String = "Favourite Things"){
        self.title = title
        things = [Thing]()
        detailViewModel = DetailViewModel()
    }
    
    /// Creates a set of keys for use while encoding and decoding data
    enum CodingKeys: String, CodingKey {
        case title
        case things
        case detailViewModel
    }

    /// - Note: Refer to init function for parameters
    /// Function is used to read decode and read data from JSON file
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        things = try container.decode([Thing].self, forKey: .things)
        detailViewModel = try container.decode(DetailViewModel.self, forKey: .detailViewModel)
    }

    /// Function is used to prepare data to be written to JSON file
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(things, forKey: .things)
        try container.encode(detailViewModel, forKey: .detailViewModel)
    }
    
    /// Function appends new thing to things array
    func addThing(){
        self.things.append(Thing(name: "quack", like: "quack quack", type: "quack quack quack", purpose: "quack quack", description: "quack quack quack quack", staticImage: "duck"))
    }
    
    /// Function removes thing from things array
    /// - Parameters:
    ///     - indices: The indices within the Index Set of item which has been selected for removal
    func removeThing(_ indices: IndexSet){
        indices.forEach { things.remove(at: $0) }
    }
    
}