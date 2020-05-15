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
        self.isUpdating = true
        print("Happened")
        let centre = mapView.centerCoordinate
        self.latitude = centre.latitude
        self.longitude = centre.longitude
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250)) {
            self.isUpdating = false
        }
    }
}
