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
            buttonSave
            location
        }
    }

    var buttonSave: some View {
        Button("Save") {
            // dada a localizacao encontrar um lugar e atualizar a contagem ou criar um novo
            var place = verifyList(latitude, longitude)
            /* se ja existir um lugar com aquela latidude altera o numero de repeticoes e
             salva o novo local
             */
            if place != nil {
                place?.placeList.numbersRepeated += 1
                vm.saveItem(place!.placeList)
            } else {
                vm.saveNewItem(name: "aqui", numbersRepeated: 1, latitude: latitude, longitude: longitude)
            }
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

        Map(coordinateRegion: $region, annotationItems: vm.places) {
            MapAnnotation(coordinate: $0.placeList.coordinate) {
                ForEach(vm.places, id: \.recordID) { place in
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

        }
        .onAppear {
            latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0.0
            longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0.0
            Task {
                try await vm.populatePlaces()

            }
        }

    }


    func verifyList(_ latitudePlace: Double, _ longitudePlace: Double) -> PlaceViewModel? {
        let collection = vm.places
        let filtered = collection.filter {
            $0.latitude.isAlmostEqual(to: latitudePlace, tolerance: 0.000001) &&
            $0.longitude.isAlmostEqual(to: longitudePlace, tolerance: 0.000001)
        }

        if let place = filtered.first {
            return place
        } else {
            return nil
        }
    }
}

