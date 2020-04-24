//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import UIKit
import SwiftUI

// Code identifies location of data storage file amongst application documents
let fileManager = FileManager.default
let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
let documentFolderURL = urls.first!
let fileURL = documentFolderURL.appendingPathComponent("favouriteThings.json")

/// Function encodes View Model and writes it to a JSON file.
/// - Parameters:
///     - model: Typically going to be ViewModel or any data model which needs to be written to JSON
func writeData(_ model: ViewModel){
    do {
        let json = JSONEncoder()
        let data = try json.encode(model)
        try data.write(to: fileURL)
        print("This Happened")
    } catch {
        print("Could not write file - \(error)")
    }
}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewModel = ViewModel()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Code Reads data from JSON file and restores ViewModel upon initialisation of app
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedModel = try decoder.decode(ViewModel.self, from:t)
            print(decodedModel.things.first?.name ?? "No Items Here")
            viewModel = decodedModel
            print("Made it to here")
        } catch {
            print("Could not load \(fileURL)")
        }

        // Section of code restores Images to all Things which are using a dynamic image
        for thing in viewModel.things {
            thing.imageFromUrl(thing.dynamicImage)
        }
        
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView(viewModel: viewModel)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        writeData(viewModel)

        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        writeData(viewModel)
    }


}

