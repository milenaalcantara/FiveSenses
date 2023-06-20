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
                    .padding()
            case .restricted, .denied:
                Text("Current location data was restricted or denied.")
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
        .padding()
    }
    var mapview: some View {

        Map(coordinateRegion: $region, annotationItems: vm.places) { place in
            MapAnnotation(coordinate: place.placeList.coordinate) {
                ZStack {
                    VStack(alignment: .trailing, spacing: -20) {
                        Rectangle()
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .foregroundColor(ColorSenses.pinLocation)
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .rotationEffect(Angle(degrees: 30))
                            .foregroundColor(ColorSenses.pinLocation)
                            .padding(.trailing, 11)
                    }

                    HStack (alignment: .center ,spacing: 10){
                        Image("PinImage")
                            .frame(width: 5, height: 5)
                        Text("\(place.numbersRepeated)") // colocar aqui o numero de vezes q se rep
                            .foregroundColor(.black)
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
}

