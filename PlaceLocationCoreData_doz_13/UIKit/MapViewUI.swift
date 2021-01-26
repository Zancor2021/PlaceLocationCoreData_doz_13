import SwiftUI
import MapKit

class Pin: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String = ""
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
}



struct MapViewUI: UIViewRepresentable {
    let region: MKCoordinateRegion
    let mapType : MKMapType
    
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.setRegion(region, animated: false)
        mapView.addAnnotation(Pin(title: "lol", coordinate: CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude), info: "Hallo"))
        mapView.mapType = mapType
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
        mapView.region  = region
    }
}
