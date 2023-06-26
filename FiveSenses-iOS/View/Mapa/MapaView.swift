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

    @State private var placeImage: Image?
    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    @State var showDetails: Bool = false

    var placemark: String { return("\(locationDataManager.placemark?.name ?? "Loading...")")}

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
            switch locationDataManager.status {
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
        .ignoresSafeArea()
    }
    var mapview: some View {

        Map(coordinateRegion: $region, annotationItems: vm.places) { place in
            MapAnnotation(coordinate: place.placeList.coordinate) {
                ZStack(alignment: .center) {
                    Button {
                        showDetails.toggle()
                    }
                label: {
                    ZStack(alignment: .center) {
                        VStack(spacing: -32){
                            Image("Union")
                                .frame(width: 5, height: 5)
                                .scaledToFit()
                            HStack (alignment: .firstTextBaseline, spacing: 20){
                                Image("PinImage")
                                    .frame(width: 10, height: 10)
                                Text("\(place.numbersRepeated)") // colocar aqui o numero de vezes q se rep
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                    }
                }
                .sheet(isPresented: $showDetails) {
                    VStack {
                        if let image = placeImage {
                            Text("\(self.placemark)")
                                .presentationDetents([.large, .medium])
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                        } else {
                            Text("Carregando imagem...")
                        }
                    }
                }
                }

            }
        }
        .onAppear {
            Task {
                try await vm.populatePlaces()

                DispatchQueue.main.async {
                    let latitude = vm.places.first?.latitude ?? 0
                    let longitude = vm.places.first?.longitude ?? 0
                    fetchPlaceImage(latitude, longitude) { data in
                        print("DID FIND IMAGE")
                        if let uiImage = UIImage(data: data) {
                            placeImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }

        }
    }

    func fetchPlaceImage(_ latitudePlace: Double, _ longitudePlace: Double, completion: @escaping (Data) -> Void) {
        fetchPlaceIDs(latitudePlace, longitudePlace) { placeID in
            let apiKey = "AIzaSyCqzJWVMquOA9mbdvvWX_JM5yN5qNBabKA"
            getPhotoReferenceFromPlaceID(placeID: placeID, apiKey: apiKey) { result in

                if case .success(let photoReference) = result {
                    let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&maxheight=300&photoreference=\(photoReference)&key=\(apiKey)"

                    if let url = URL(string: urlString) {
                        URLSession.shared.dataTask(with: url) { data, response, error in
                            if let data {
                                DispatchQueue.main.async {

                                    completion(data)
                                }
                            }
                        }.resume()
                    }
                }
            }
        }


        //        let photoReference = "Aap_uEA7vb0DDYVJWEaX3O-AtYp77AaswQKSGtDaimt3gt7QCNpdjp1BkdM6acJ96xTec3tsV_ZJNL_JP-lqsVxydG3nh739RE_hepOOL05tfJh2_ranjMadb3VoBYFvF0ma6S24qZ6QJUuV6sSRrhCskSBP5C1myCzsebztMfGvm7ij3gZT"

    }
    func fetchPlaceIDs(_ latitudePlace: Double, _ longitudePlace: Double, completionHandler: @escaping (String) -> Void) {
        //        let latitude = 37.335556
        //        let longitude = -122.009167
        //        var placeID: String = "Aap_uEA7vb0DDYVJWEaX3O-AtYp77AaswQKSGtDaimt3gt7QCNpdjp1BkdM6acJ96xTec3tsV_ZJNL_JP-lqsVxydG3nh739RE_hepOOL05tfJh2_ranjMadb3VoBYFvF0ma6S24qZ6QJUuV6sSRrhCskSBP5C1myCzsebztMfGvm7ij3gZT"
        var placeID: String = ""
        let radius = 150
        let apiKey = "AIzaSyCqzJWVMquOA9mbdvvWX_JM5yN5qNBabKA"

        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitudePlace),\(longitudePlace)&radius=\(radius)&key=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        if let results = json?["results"] as? [[String: Any]] {
                            placeID = results[0]["place_id"] as! String
                            completionHandler(placeID)
                        }

                    } catch {
                        print("Error: \(error.localizedDescription)")

                    }
                }
            }.resume()
        }
    }

    struct Coisinha: Codable {
        let result: CoisinhaPhoto
    }

    struct CoisinhaPhoto: Codable {
        let photos: [CoisinhaPhotoReference]
    }

    struct CoisinhaPhotoReference: Codable {
        let photo_reference: String
    }

    func getPhotoReferenceFromPlaceID(placeID: String, apiKey: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
        guard var urlComponent = URLComponents(string: "https://maps.googleapis.com") else { return }
        urlComponent.path = "/maps/api/place/details/json"
        urlComponent.queryItems = [
            .init(name: "output", value: "json"),
            .init(name: "place_id", value: placeID),
            .init(name: "key", value: apiKey)
        ]

        if let url = urlComponent.url {

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                if let error {
                    print("Erro na requisição: \(error.localizedDescription)")
                    return
                }
                if let data {
                    do {
                        let coisinha = try JSONDecoder().decode(Coisinha.self, from: data)
                        var coisaArray = [String]()

                        for coisa in coisinha.result.photos {
                            coisaArray.append(coisa.photo_reference)
                        }

                        completionHandler(.success(coisaArray[1]))

                    } catch {
                        print("Erro ao processar a resposta: \(error.localizedDescription)")
                        completionHandler(.failure(error))
                    }
                }
            }

            task.resume()
        }
    }
}

