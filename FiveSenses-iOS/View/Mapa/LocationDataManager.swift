////
////  LocationDataManager.swift
////  FiveSenses-iOS
////
////  Created by Narely Lima on 16/06/23.
////
//
//import Foundation
//import CoreLocation
//
//class LocationDataManager : NSObject, CLLocationManagerDelegate, ObservableObject {
//
//    @Published var authorizationStatus: CLAuthorizationStatus?
//    var locationManager = CLLocationManager()
//
//   override init() {
//      super.init()
//      locationManager.delegate = self
//   }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//            switch manager.authorizationStatus {
//            case .authorizedWhenInUse:
//                authorizationStatus = .authorizedWhenInUse
//                locationManager.requestLocation()
//                break
//
//            case .restricted:
//                authorizationStatus = .restricted
//                break
//
//            case .denied:
//                authorizationStatus = .denied
//                break
//
//            case .notDetermined:
//                authorizationStatus = .notDetermined
//                manager.requestWhenInUseAuthorization()
//                break
//
//            default:
//                break
//            }
//        }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//           print("Os dados estão disponíveis")
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//           print("error: \(error.localizedDescription)")
//    }
//}
