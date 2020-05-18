//
//  Thing + ViewModel + Map.swift
//  FavouriteThings
//
//  Created by Zak Barker on 15/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation
import MapKit

extension Thing: MKMapViewDelegate {
    
    
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        guard !self.isUpdating else {
            return
        }
        print("View did Change Before: \(self.locationXStr)")
        self.isUpdating = true
        print("Happened")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(1000)) {
            let centre = mapView.centerCoordinate
                    print("Center:   \(centre)")
                    self.latitude = centre.latitude
                    self.longitude = centre.longitude
                    self.locationXStr = "\(centre.latitude)"
                    self.locationYStr = "\(centre.longitude)"
                    print("View did Change After: \(self.locationXStr)")
                    print(self.locationYStr)
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(2000)) {
            self.isUpdating = false
            
        }
    }
}
