//
//  MapaView.swift
//  FiveSenses-iOS
//
//  Created by Narely Lima on 16/06/23.
//

import SwiftUI
import CoreLocation
import MapKit
import CloudKit

struct MapaView: View {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -3.74, longitude: -38.53), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    @StateObject var locationDataManager = LocationDataManager()
    @StateObject private var vm: PlaceListViewModel

    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    @State var showSheet: Bool = false
    @State var locationName: String = ""
    
    init(vm: PlaceListViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    var body: some View {
        VStack {
            location
        }
    }
    var location: some View {
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                mapview
            case .restricted, .denied:
                Text("Current location data was restricted or denied.")
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }

        .padding(.bottom, 0)
    }
    var mapview: some View {

        Map(coordinateRegion: $region, annotationItems: vm.places) { place in
            MapAnnotation(coordinate: place.placeList.coordinate) {
                Button {
                    Task {
                        reverseGeocoding(CLLocation(latitude: place.latitude, longitude: place.longitude)) { result in
                            switch result {
                            case .success(let local):
                                locationName = local ?? "We do not identify this location, sorry"

                            case .failure(let error):
                                print(error.localizedDescription)
                            }

                        }
                    }
                    showSheet.toggle()
                } label: {
                    ZStack {
                        Image("Union")

                        HStack (alignment: .center ,spacing: 10){
                            Image("PinImage")
                                .frame(width: 5, height: 5)
                            Text("\(place.numbersRepeated)") // colocar aqui o numero de vezes q se rep
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: $showSheet) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(locationName)")
                        Text(place.numbersRepeated > 1 ?
                        "Você usou o 5Sense \(place.numbersRepeated) vezes neste local!"
                        :
                        "Você usou o 5Sense \(place.numbersRepeated) vez neste local!")
                        .presentationDetents([.large, .fraction(0.4)])

                        Spacer()

                        ButtonCustom(backgroundColor: Color("Black"),
                                     foregroundColor: Color("White"),
                                     font: .body,
                                     title: "Deletar",
                                     height: 54) {
                            Task {
                                try await vm.deleteItem(place.recordID)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Task {
                try await vm.populatePlaces()
            }
        }
    }

    func reverseGeocoding(_ cllocation: CLLocation, completionHandler: @escaping (Result<String?, Error>) -> Void) {
        let geocoder = CLGeocoder()
        var endereco: String? = ""
        geocoder.reverseGeocodeLocation(cllocation, completionHandler: {(placemarks, error) -> Void in
            if let error = error {
                print("Failed to retrieve address")
                completionHandler(.failure(error))
                return
            }

            if let placemarks = placemarks, let placemark = placemarks.first {
                print(placemark.address!)
                endereco = placemark.address
                completionHandler(.success(endereco))
            }
            else
            {
                print("No Matching Address Found")
            }
        })
    }
}

extension CLPlacemark {

    var address: String? {
        if let name = name {
            var result = name

            if let street = thoroughfare {
                result += ", \(street)"
            }

            if let city = locality {
                result += ", \(city)"
            }

            if let country = country {
                result += ", \(country)"
            }

            return result
        }

        return nil
    }

}
