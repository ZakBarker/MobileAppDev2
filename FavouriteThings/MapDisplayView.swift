//
//  MapDisplayView.swift
//  FavouriteThings
//
//  Created by Zak Barker on 15/5/20.
//  Copyright © 2020 Zak Barker. All rights reserved.
//

import SwiftUI
import MapKit

struct MapDisplayView: UIViewRepresentable {
    @ObservedObject var thing: Thing
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = thing
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !self.thing.isUpdating else { return }
        print("#####################################")
        print("UIView Before: \(self.thing.locationXStr)")
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.thing.latitude, longitude: self.thing.longitude), latitudinalMeters: 100_000, longitudinalMeters: 100_000)
        print("UIView After: \(self.thing.locationXStr)")

        mapView.setRegion(region, animated: true)
    }
}
