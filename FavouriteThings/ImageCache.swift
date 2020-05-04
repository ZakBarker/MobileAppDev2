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

class ImageCache {
    var imageCache: Dictionary<URL, Image> = [:]
    
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
//        self.dynamicImage = imageURL
    }
    
    /// Function provides image for display in the detail view
    ///  - Note: Replace the Image function within the **Detail View** with this function to display the desired image
    /// - Returns: An Image
//    func displayImageDetail() -> Image{
//        // If url provided can not be converted to URL, display placeholder image.
//        guard let url = URL(string: self.imageURL)
//            else{
//                return Image(self.staticImage)
//        }
//        // Also convert dynamic Image URL
//        guard let dynamicUrl = URL(string: self.dynamicImage)
//            else{
//                return Image(self.staticImage)
//        }
//        // If image URL exists within imageCache, display image - else display either placeholder image or dynamic image.
//        if let img = self.imageCache[url] {
//            return img
//        }
//            // First check if dynamic URL already exists before reverting to placeholder image
//        else if let dynamicImg = self.imageCache[dynamicUrl]{
//            return dynamicImg
//        }
//        else{
//            return Image(self.staticImage)
//        }
//    }
//
//    /// Function provides image for display in Row View
//    ///  - Note: Replace the Image function within the **Row View** with this function to display the desired image
//    /// - Returns: An Image
//    func displayImageRow() -> Image{
//        // If dynamicImage string can not be converted to URL, display placeholder image.
//        guard let url = URL(string: self.dynamicImage)
//            else{
//                return Image(self.staticImage)
//        }
//        // If dynamicImage exists in the imageCache, display image - else display placeholder image.
//        if let img = self.imageCache[url] {
//            return img
//        }
//        else{
//            return Image(self.staticImage)
//        }
//    }
//
}
