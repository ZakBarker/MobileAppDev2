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
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.thing.latitude, longitude: self.thing.longitude), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
}
