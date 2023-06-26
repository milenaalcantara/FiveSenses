//
//  MapaTeste.swift
//  FiveSenses-iOS
//
//  Created by Narely Lima on 21/06/23.
//

//import SwiftUI
//import CoreLocation
//import Combine
//
//class LocationManager: NSObject, ObservableObject {
//    private let geocoder = CLGeocoder()
//
//    private let locationManager = CLLocationManager()
//    let objectWillChange = PassthroughSubject<Void, Never>()
//
//    @Published var status: CLAuthorizationStatus? {
//        willSet { objectWillChange.send() }
//    }
//
//    @Published var location: CLLocation? {
//        willSet { objectWillChange.send() }
//    }
//    @Published var placemark: CLPlacemark? {
//        willSet { objectWillChange.send() }
//    }
//
//    override init() {
//       super.init()
//
//       self.locationManager.delegate = self
//       self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//       self.locationManager.requestWhenInUseAuthorization()
//       self.locationManager.startUpdatingLocation()
//     }
//
//    private func geocode() {
//        guard let location = self.location else { return }
//        geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
//          if error == nil {
//            self.placemark = places?[0]
//          } else {
//            self.placemark = nil
//          }
//        })
//    }
//}
//
//struct CityListScene: View {
//    @ObservedObject var lm = LocationManager()
//
//    var latitude: String  { return("\(lm.location?.latitude ?? 0)") }
//    var longitude: String { return("\(lm.location?.longitude ?? 0)") }
//    var placemark: String { return("\(lm.placemark?.name ?? "XXX")") }
//
//    var body: some View {
//        VStack {
//            Text("Latitude: \(self.latitude)")
//            Text("Longitude: \(self.longitude)")
//            Text("Placemark: \(self.placemark)")
//        }
//    }
//}
