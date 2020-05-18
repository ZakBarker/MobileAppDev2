//
//  MapDisplayView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 15/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI
import MapKit

// Displays the actual Map Interface within the Map and acts as a Controller
struct MapDisplayView: UIViewRepresentable {
    @ObservedObject var thing: Thing
    
    /// - Remark: Initializes the Map, Declares Delegate and Sets Initial Region
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.thing.latitude, longitude: self.thing.longitude), latitudinalMeters: 100_000, longitudinalMeters: 100_000)
        mapView.setRegion(region, animated: false)
        mapView.delegate = thing
        return mapView
    }
    
    /// - Remark: Continually updates Map
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !self.thing.isUpdating else { return }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.thing.latitude, longitude: self.thing.longitude), latitudinalMeters: 100_000, longitudinalMeters: 100_000)
        mapView.setRegion(region, animated: true)
    }
}
