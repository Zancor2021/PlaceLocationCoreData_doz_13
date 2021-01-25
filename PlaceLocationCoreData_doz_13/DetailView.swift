//
//  DetailView.swift
//  PlaceLocationCoreData_doz_13
//
//  Created by Alexander Hoch on 25.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct DetailView: View {
  
  @ObservedObject var dm:DataController = DataController()
  @State var isPresented = false
    
   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.61900, longitude: -74.14053) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let p:Place
    
var body: some View {
  
    
        VStack{
            Text("\(p.lat)")
            Text("\(p.lon)")
            MapViewUI(region: region, mapType: .standard)
        }.frame(width: 300, height: 400, alignment: .center).onAppear{
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.p.lat, longitude: self.p.lon) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
       }
    
    
    
    
    }
    
}
