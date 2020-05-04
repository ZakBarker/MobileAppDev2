//
//  ImageCache.swift
//  FavouriteThings
//
//  Created by Zak Barker on 4/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

// Provided to store dynamically sourced images from Urls. This is to help the app with performance.
class ImageCache: ObservableObject {
    @ Published var imageStore: Dictionary<URL, Image> = [:]
    
    /// Function provides image for display in the views
    ///  - Parameters:
    ///     - dynamicUrl: An image Url in String Form
    ///  - Note: Function returns a dynamic Image Url to assign to an Instance of a Thing for later use. If Url does not correctly Convert to Image, returns empty String
    /// - Returns: A String value for the Image Url if conversion is successfu
    func imageFromUrl(_ imageUrl: String) -> String{
        // Convert String to URL
        guard let url = URL(string: imageUrl)
            else{
                return ""
        }
        // Use url to retrieve image data
        guard let imageData = try? Data(contentsOf: url)
            else {
                return ""
        }
        // Convert image data into image
        guard let uiImage = UIImage(data: imageData) else {
            return ""
        }
        // If successful, Store image in imageCache and set dynamicImage to fit the url string
        let img = Image(uiImage: uiImage)
        self.imageStore[url] = img
        return imageUrl
    }
    
    /// Function provides image for display in the views
    ///  - Parameters:
    ///     - dynamicUrl: The dynamic Url for a thing
    ///     - staticUrl: The static Url for a thing
    ///  - Note: Replace the Image function within the **Detail View** with this function to display the desired image
    /// - Returns: An Image
    func displayImageDetail(_ dynamicUrl: String, staticUrl: String) -> Image{
        // If url provided can not be converted to URL, display placeholder image.
        guard let dynamicUrl = URL(string: dynamicUrl)
            else{
                return Image(staticUrl)
        }
        // If image URL exists within imageCache, display image - else display either placeholder image or dynamic image.
        if let img = self.imageStore[dynamicUrl] {
            return img
        }
            // First check if dynamic URL already exists before reverting to placeholder image
        else if let dynamicImg = self.imageStore[dynamicUrl]{
            return dynamicImg
        }
        else{
            return Image(staticUrl)
        }
    }
}
