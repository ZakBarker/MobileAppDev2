//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Zak Barker on 23/4/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
   
    var window: UIWindow?
        
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Nehoooooop")
        }
        
        
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "ViewModels")
        //Image Cache stores images for easy access by Application
        let imageCache = ImageCache()
        //ViewContext created to pass container through to environment
        let viewContext = delegate.persistentContainer.viewContext
        
        // Code Calls NSFetch Request to check if CoreData is empty.
        do {
            let dumbModel = try viewContext.fetch(request) as! [ViewModels]
            // If DataBase is empty, Create new ViewModel in context and append dummy data
            if dumbModel.isEmpty {
                let dumbData = ViewModels(context: viewContext)
                dumbData.title = "Favourite Things"
                let thing1 = Thing(context: viewContext)
                thing1.newThing(thing: thing1)
                thing1.staticImage = "forest"
                thing1.viewModels = dumbData
                let thing2 = Thing(context: viewContext)
                thing2.newThing(thing: thing2)
                thing2.staticImage = "daft"
                thing2.viewModels = dumbData
                let thing3 = Thing(context: viewContext)
                thing3.newThing(thing: thing3)
                thing3.staticImage = "draw"
                thing3.viewModels = dumbData
            }
            // If DataBase exists, Check each instance of type Thing for dynamic Image and call function to append these to imageCache Dictionary for later use of displaying Dynamic image in View.
            else {
                let dumbData = dumbModel.first
                // Value is safely force unwrapped because it can be inferred that option will never return "nil" based on top level of if/else statement
                for thing in dumbData!.properThing{
                    imageCache.imageFromUrl(thing.dynamicImageStr)
                }
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }


        // Passes environment Object along with Image Cache for use in Views. Environment contains CoreData
        let contentView = ContentView(imageCache: imageCache).environment(\.managedObjectContext, viewContext)


//        // Section of code restores Images to all Things which are using a dynamic image
//        for thing in viewModel.things {
//            thing.imageFromUrl(thing.dynamicImage)
//        }
        
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
        // Code saves Application data on disconnect
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Nehoooooop")
        }
        let viewContext = delegate.persistentContainer.viewContext
        if viewContext.hasChanges {
            _ = try? viewContext.save()
        }
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
        // Code saves Application data on disconnect
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Nehoooooop")
        }
        let viewContext = delegate.persistentContainer.viewContext
        if viewContext.hasChanges {
            _ = try? viewContext.save()
        }
    }


}

