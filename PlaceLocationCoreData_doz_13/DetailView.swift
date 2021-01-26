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
  @State var showMap = false
    
   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.505438, longitude: 13.460627) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State var image: Image? = nil
          @State var imageUI: UIImage? = nil
    let p:Place
    
var body: some View {
  
    
        VStack{
            Text("\(p.title!)")
               image?.resizable().frame(width: 300.0, height: 250.0)
            HStack{
                Text("\(p.lat)")
            Text("\(p.lon)")
            }
            if(showMap){
            MapViewUI(region: region, mapType: .standard)
            }
        }.frame(width: 300, height: 600, alignment: .center).onAppear{
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.p.lat, longitude: self.p.lon) , span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.showMap = true
            
            self.imageUI = UIImage(data: self.p.img!)
            self.image = Image(uiImage: self.imageUI!)
       }
    
    
    
    
    }
    
}
