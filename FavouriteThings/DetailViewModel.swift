//
//  DetailViewModel.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation
/// Class contains embedded information to be displayed within the view. This is useful in the case that information must be stored in several languages
class DetailViewModel: ObservableObject, Identifiable, Codable{
    /// Embedded information for notes field
    @Published var notes: String
    /// Embedded information for notes placeholder
    @Published var notesPlaceholder: String
    /// Embedded information for type field
    @Published var type: String
    /// Embedded information for left field
    @Published var purpose: String
    /// Embedded information for right field
    @Published var description: String
    /// Embedded information for name placeholder
    @Published var namePlaceholder: String
    /// Embedded information for country placeholder
    @Published var likePlaceholder: String
    /// Embedded information for type placeholder
    @Published var typePlaceholder: String
    /// Embedded information for left placeholder
    @Published var purposePlaceholder: String
    /// Embedded information for right placeholder
    @Published var descriptionPlaceholder: String
    /// Embedded information for name image url placeholder
    @Published var imagePlaceholder: String

    
    /// Used to initialize an instance of type Wave
    /// - Parameters:
    ///     - notes: Embedded information for notes field
    ///     - notesPlaceholder: Embedded information for notes placeholder
    ///     - type: Embedded information for type field
    ///     - purpose: Embedded information for purpose field
    ///     - description: Embedded information for description field
    ///     - namePlaceholder: Embedded information for name placeholder
    ///     - likePlaceholder: Embedded information for like placeholder
    ///     - typePlaceholder: Embedded information for type placeholder
    ///     - purposePlaceholder: Embedded information for purpose placeholder
    ///     - descriptionPlaceholder: Embedded information for description placeholder
    ///     - imagePlaceholder: Embedded information for name image url placeholder
    
    
    init(notes: String = "Notes:", type: String = "Type:", purpose: String = "Purpose:", description: String = "Description:", notesPlaceholder: String = "Add Some Notes Here",namePlaceholder: String = "What is this thing?", likePlaceholder: String = "Why do you like this thing?", typePlaceholder: String = "What is the type of this thing?", purposePlaceholder: String = "What is the purpose of this thing?", descriptionPlaceholder: String = "Write a description", imagePlaceholder: String = "Insert Image URL"){
        self.notes = notes
        self.notesPlaceholder = notesPlaceholder
        self.type = type
        self.purpose = purpose
        self.description = description
        self.namePlaceholder = namePlaceholder
        self.likePlaceholder = likePlaceholder
        self.typePlaceholder = typePlaceholder
        self.purposePlaceholder = purposePlaceholder
        self.descriptionPlaceholder = descriptionPlaceholder
        self.imagePlaceholder = imagePlaceholder
    }
    
    enum CodingKeys: String, CodingKey {
        case notes
        case notesPlaceholder
        case type
        case purpose
        case description
        case namePlaceholder
        case likePlaceholder
        case typePlaceholder
        case purposePlaceholder
        case descriptionPlaceholder
        case imagePlaceholder
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        notes = try container.decode(String.self, forKey: .notes)
        notesPlaceholder = try container.decode(String.self, forKey: .notesPlaceholder)
        type = try container.decode(String.self, forKey: .type)
        purpose = try container.decode(String.self, forKey: .purpose)
        description = try container.decode(String.self, forKey: .description)
        namePlaceholder = try container.decode(String.self, forKey: .namePlaceholder)
        likePlaceholder = try container.decode(String.self, forKey: .likePlaceholder)
        typePlaceholder = try container.decode(String.self, forKey: .typePlaceholder)
        purposePlaceholder = try container.decode(String.self, forKey: .purposePlaceholder)
        descriptionPlaceholder = try container.decode(String.self, forKey: .descriptionPlaceholder)
        imagePlaceholder = try container.decode(String.self, forKey: .imagePlaceholder)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(notes, forKey: .notes)
        try container.encode(notesPlaceholder, forKey: .notesPlaceholder)
        try container.encode(type, forKey: .type)
        try container.encode(purpose, forKey: .purpose)
        try container.encode(description, forKey: .description)
        try container.encode(namePlaceholder, forKey: .namePlaceholder)
        try container.encode(likePlaceholder, forKey: .likePlaceholder)
        try container.encode(typePlaceholder, forKey: .typePlaceholder)
        try container.encode(purposePlaceholder, forKey: .purposePlaceholder)
        try container.encode(descriptionPlaceholder, forKey: .descriptionPlaceholder)
        try container.encode(imagePlaceholder, forKey: .imagePlaceholder)
    }
    
}
