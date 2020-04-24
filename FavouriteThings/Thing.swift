//
//  Thing.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// Class Stores all information relating to particular Things that the user likes. This data will be passed to the DetailView for display.

class Thing: ObservableObject, Identifiable, Codable{
    /// Name of Thing
    @Published var name: String
    /// Why you Like the Thing
    @Published var like: String
    /// Type of Thing
    @Published var type: String
    /// Purpose of Thing
    @Published var purpose: String
    /// Description of Thing
    @Published var description: String
    /// Static Image of Thing which occurs before user edits Thing
    @Published var staticImage: String
    /// Stores Url for display of dynamic images if the user provides one
    @Published var dynamicImage: String
    /// Notes for Thing
    @Published var notes: String
    /// Stores image url passed in by user.
    @Published var imageURL: String
    /// Stores a list of urls which correspond to Images that have already been downloaded
    @Published var imageCache: Dictionary<URL, Image> = [:]
    
    /// Used to initialize an instance of type Thing
    /// - Parameters:
    ///     - name: Name of Thing
    ///     - like: Why you Like the Thing
    ///     - type: Type of Thing
    ///     - purpose: Purpose of Thing
    ///     - description: Description of Thing
    ///     - staticImage: Static Image of Thing which occurs before user edits Thing
    ///     - dynamicImage: Stores Url for display of dynamic images if the user provides one
    ///     - notes: Notes for Thing
    ///     - imageURL: Stores image url passed in by user.
    ///     - imageCache: Stores a list of urls which correspond to Images that have already been downloaded
    
    init(name: String, like: String, type: String, purpose: String, description: String, staticImage: String, dynamicImage: String = "", notes: String = "", imageURL: String = ""){
        self.name = name
        self.like = like
        self.type = type
        self.purpose = purpose
        self.description = description
        self.staticImage = staticImage
        self.dynamicImage = dynamicImage
        self.notes = notes
        self.imageURL = imageURL
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case like
        case type
        case purpose
        case description
        case staticImage
        case dynamicImage
        case notes
        case imageURL
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        like = try container.decode(String.self, forKey: .like)
        type = try container.decode(String.self, forKey: .type)
        purpose = try container.decode(String.self, forKey: .purpose)
        description = try container.decode(String.self, forKey: .description)
        staticImage = try container.decode(String.self, forKey: .staticImage)
        dynamicImage = try container.decode(String.self, forKey: .dynamicImage)
        notes = try container.decode(String.self, forKey: .notes)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(like, forKey: .like)
        try container.encode(type, forKey: .type)
        try container.encode(purpose, forKey: .purpose)
        try container.encode(description, forKey: .description)
        try container.encode(staticImage, forKey: .staticImage)
        try container.encode(dynamicImage, forKey: .dynamicImage)
        try container.encode(notes, forKey: .notes)
        try container.encode(imageURL, forKey: .imageURL)
    }
    
    
    /// Function recieves a string and attempts to convert this to a URL. Function then checks to make sure URL is an image and downloads that image. Image and URL are then stored in imageCache
    func imageFromUrl(_ imageUrl: String){
        // Convert String to URL
        guard let url = URL(string: imageUrl)
            else{
                return
        }
        // Use url to retrieve image data
        guard let imageData = try? Data(contentsOf: url)
            else {
                return
        }
        // Convert image data into image
        guard let uiImage = UIImage(data: imageData) else {
            return
        }
        // If successful, Store image in imageCache and set dynamicImage to fit the url string
        let img = Image(uiImage: uiImage)
        imageCache[url] = img
        self.dynamicImage = imageURL
    }
    
    /// Function provides image for display in the detail view
    func displayImageDetail() -> Image{
        // If url provided can not be converted to URL, display placeholder image.
        guard let url = URL(string: self.imageURL)
            else{
                return Image(self.staticImage)
        }
        // Also convert dynamic Image URL
        guard let dynamicUrl = URL(string: self.dynamicImage)
            else{
                return Image(self.staticImage)
        }
        // If image URL exists within imageCache, display image - else display either placeholder image or dynamic image.
        if let img = self.imageCache[url] {
            return img
        }
            // First check if dynamic URL already exists before reverting to placeholder image
        else if let dynamicImg = self.imageCache[dynamicUrl]{
            return dynamicImg
        }
        else{
            return Image(self.staticImage)
        }
    }
    
    /// Function provides image for display in Row View
    func displayImageRow() -> Image{
        // If dynamicImage string can not be converted to URL, display placeholder image.
        guard let url = URL(string: self.dynamicImage)
            else{
                return Image(self.staticImage)
        }
        // If dynamicImage exists in the imageCache, display image - else display placeholder image.
        if let img = self.imageCache[url] {
            return img
        }
        else{
            return Image(self.staticImage)
        }
    }
}
