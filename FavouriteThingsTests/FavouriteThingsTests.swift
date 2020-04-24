//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import XCTest
import Foundation
import SwiftUI
@testable import FavouriteThings

class ReferencerTests: XCTestCase {
    // Create instance of type Thing & type DetailViewModel for testing purposes
    var thing = Thing(name: "Pencil", like: "It make words", type: "Innanimate Object", purpose: "Writing", description: "Long and thin", staticImage: "duck")
    var detailViewModel = DetailViewModel()
    
    
    //Create instance of type ViewModel for testing purposes
    var viewModel = ViewModel()
    
    override func setUp() {
        // Append instance of type Thing to Things array for testing purposes
        self.viewModel.things.append(thing)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Test the functionality of Thing Class
    func testThing() {
        XCTAssertEqual(thing.name, "Pencil")
        XCTAssertEqual(thing.like, "It make words")
        XCTAssertEqual(thing.type, "Innanimate Object")
        XCTAssertEqual(thing.purpose, "Writing")
        XCTAssertEqual(thing.description, "Long and thin")
        XCTAssertEqual(thing.staticImage, "duck")
        XCTAssertEqual(thing.dynamicImage, "")
        XCTAssertEqual(thing.notes, "")
        XCTAssertEqual(thing.imageURL, "")

    }

    /// Test the functionality of instances within array of Things.
    func testThings(){
        XCTAssertEqual(viewModel.things.count, 1)
        XCTAssertEqual(viewModel.things[0].name, "Pencil")
        XCTAssertEqual(viewModel.things[0].like, "It make words")
        XCTAssertEqual(viewModel.things[0].type, "Innanimate Object")
        XCTAssertEqual(viewModel.things[0].purpose, "Writing")
        XCTAssertEqual(viewModel.things[0].description, "Long and thin")
        XCTAssertEqual(viewModel.things[0].staticImage, "duck")
        XCTAssertEqual(viewModel.things[0].dynamicImage, "")
        XCTAssertEqual(viewModel.things[0].notes, "")
        XCTAssertEqual(viewModel.things[0].imageURL, "")
    }
    
    /// Test AddThing() Method of Class View Model. Adds 3 new Thing instances and verifies that they have been appended
    func testAddThing(){
        self.viewModel.things.append(thing)
        self.viewModel.things.append(thing)
        self.viewModel.things.append(thing)
        XCTAssertEqual(viewModel.things.count, 4)
    }
    
    /// Tests integrity of data appended to View Model Things Array by creating one new Thing Instance
    func testAppendedThing(){
        self.viewModel.addThing()
        XCTAssertEqual(viewModel.things.count, 2)
        XCTAssertEqual(viewModel.things[1].name, "quack")
        XCTAssertEqual(viewModel.things[1].like, "quack quack")
        XCTAssertEqual(viewModel.things[1].type, "quack quack quack")
        XCTAssertEqual(viewModel.things[1].purpose, "quack quack")
        XCTAssertEqual(viewModel.things[1].description, "quack quack quack quack")
        XCTAssertEqual(viewModel.things[1].staticImage, "duck")
        XCTAssertEqual(viewModel.things[1].dynamicImage, "")
        XCTAssertEqual(viewModel.things[1].notes, "")
        XCTAssertEqual(viewModel.things[1].imageURL, "")
    }
    
    /// Tests RemoveWave of Class View Model
    func testRemoveThing(){
        viewModel.things.remove(at: 0)
        XCTAssertEqual(viewModel.things.count, 0)
    }
    
    /// Tests imageFromUrl Method of Class Thing - Should update dynamicImage / imageURL / imageCache attributes
    func testImageFromUrl(){
        self.thing.imageURL = "https://upload.wikimedia.org/wikipedia/commons/5/54/Mallard_drake_.02.jpg"
        self.thing.imageFromUrl(self.thing.imageURL)
        XCTAssertEqual(viewModel.things[0].imageURL, "https://upload.wikimedia.org/wikipedia/commons/5/54/Mallard_drake_.02.jpg")
        XCTAssertEqual(viewModel.things[0].dynamicImage, "https://upload.wikimedia.org/wikipedia/commons/5/54/Mallard_drake_.02.jpg")
        XCTAssertEqual(viewModel.things[0].imageCache.count, 1)
    }
    
    /// Tests the attributes within the DetailViewModel
    func testDetailViewModel(){
        XCTAssertEqual(detailViewModel.notes, "Notes:")
        XCTAssertEqual(detailViewModel.type, "Type:")
        XCTAssertEqual(detailViewModel.purpose, "Purpose:")
        XCTAssertEqual(detailViewModel.description, "Description:")
        XCTAssertEqual(detailViewModel.notesPlaceholder, "Add Some Notes Here")
        XCTAssertEqual(detailViewModel.namePlaceholder, "What is this thing?")
        XCTAssertEqual(detailViewModel.likePlaceholder, "Why do you like this thing?")
        XCTAssertEqual(detailViewModel.typePlaceholder, "What is the type of this thing?")
        XCTAssertEqual(detailViewModel.purposePlaceholder, "What is the purpose of this thing?")
        XCTAssertEqual(detailViewModel.descriptionPlaceholder, "Write a description")
        XCTAssertEqual(detailViewModel.imagePlaceholder, "Insert Image URL")
    }
    
    /// Test the integrity of DataViewModel within the ViewModel
    func testViewModelDVM(){
        XCTAssertEqual(viewModel.detailViewModel.notes, "Notes:")
        XCTAssertEqual(viewModel.detailViewModel.type, "Type:")
        XCTAssertEqual(viewModel.detailViewModel.purpose, "Purpose:")
        XCTAssertEqual(viewModel.detailViewModel.description, "Description:")
        XCTAssertEqual(viewModel.detailViewModel.notesPlaceholder, "Add Some Notes Here")
        XCTAssertEqual(viewModel.detailViewModel.namePlaceholder, "What is this thing?")
        XCTAssertEqual(viewModel.detailViewModel.likePlaceholder, "Why do you like this thing?")
        XCTAssertEqual(viewModel.detailViewModel.typePlaceholder, "What is the type of this thing?")
        XCTAssertEqual(viewModel.detailViewModel.purposePlaceholder, "What is the purpose of this thing?")
        XCTAssertEqual(viewModel.detailViewModel.descriptionPlaceholder, "Write a description")
        XCTAssertEqual(viewModel.detailViewModel.imagePlaceholder, "Insert Image URL")
    }
    
    /// Test the title field within ViewModel
    func testTitle(){
        XCTAssertEqual(viewModel.title, "Favourite Things")
    }
    
}
