//
//  LocationDataManager.swift
//  FiveSenses-iOS
//
//  Created by Narely Lima on 16/06/23.
//

import Foundation
import CoreLocation
import Combine

class LocationDataManager : NSObject, ObservableObject {

    private let geocoder = CLGeocoder()

    private let locationManager = CLLocationManager()
    
    let objectWillChange = PassthroughSubject<Void, Never>()

    @Published var status: CLAuthorizationStatus? {
        willSet { objectWillChange.send() }
    }

    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }
    @Published var placemark: CLPlacemark? {
        willSet { objectWillChange.send() }
    }

    override init() {
       super.init()

       self.locationManager.delegate = self
       self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
       self.locationManager.requestWhenInUseAuthorization()
       self.locationManager.startUpdatingLocation()
     }

    private func geocode() {
        guard let location = self.location else { return }
        geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
          if error == nil {
            self.placemark = places?[0]
          } else {
            self.placemark = nil
          }
        })
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                status = .authorizedWhenInUse
//                locationManager.requestLocation()
                break

            case .restricted:
                status = .restricted
                break

            case .denied:
                status = .denied
                break

            case .notDetermined:
                status = .notDetermined
                manager.requestWhenInUseAuthorization()
                break

            default:
                break
            }
        }
}

extension LocationDataManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("error:: \(error.localizedDescription)")
        }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
        self.geocode()
    }
}
