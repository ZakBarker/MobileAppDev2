//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import UIKit
import SwiftUI

let fileManager = FileManager.default
let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
let documentFolderURL = urls.first!
let fileURL = documentFolderURL.appendingPathComponent("favouriteThings.json")

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewModel = ViewModel()
//    let dvm = DetailViewModel()
//
//    let thing0 = Thing(name: "Drawing", like: "It is cool", type: "Medium", purpose: "Creating something", description: "Simple medium which requires different shades of pencil", staticImage: "draw")
//    let thing1 = Thing(name: "Forest", like: "They are green", type: "Landscape", purpose: "To give life", description: "Forests are pretty sweet", staticImage: "forest")
//    let thing2 = Thing(name: "The Robots", like: "All around excellent", type: "Artists", purpose: "To create mad beats", description: "The frenchmen are pioneers of EDM", staticImage: "daft")
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedModel = try decoder.decode(ViewModel.self, from:t)
            print(decodedModel.things.first?.name ?? "no products")
            viewModel = decodedModel
        } catch {
            print("Could not load \(fileURL)")
        }

//        viewModel.things.append(thing0)
//        viewModel.things.append(thing1)
//        viewModel.things.append(thing2)
//        viewModel.detailViewModel.append(dvm)
        
        
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
        
        do {
            let json = JSONEncoder()
            let data = try json.encode(viewModel)
            try data.write(to: fileURL)
        } catch {
            print("Could not write file - \(error)")
        }
    }


}

