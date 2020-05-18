//
//  Thing + ViewModel + Map.swift
//  FavouriteThings
//
//  Created by Zak Barker on 15/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import Foundation
import MapKit

// Extension adds User interaction Functionality to Map Delegate
extension Thing: MKMapViewDelegate {
    
    /// - Remark: Updates Latitude and Longitude as Map Region Changes
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        guard !self.isUpdating else {
            return
        }
        self.isUpdating = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(1000)) {
            let centre = mapView.centerCoordinate
            self.latitude = centre.latitude
            self.longitude = centre.longitude
            self.locationXStr = "\(centre.latitude)"
            self.locationYStr = "\(centre.longitude)"
            self.isUpdating = false
        }
    }
}
