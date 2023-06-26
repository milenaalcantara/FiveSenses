//
//  SenseView.swift
//  FiveSenses-iOS
//
//  Created by Milena Lima de Alcântara on 18/06/23.
//

import SwiftUI
import MapKit
import CloudKit

struct SenseView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var sense: Sense
    
    @StateObject var locationDataManager = LocationDataManager()
    @StateObject var vm: PlaceListViewModel
    
    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    
    @Binding var animationName: String
    
    let container = CKContainer(identifier: "iCLoud.locaisVisitados")

    init(vm: PlaceListViewModel, animationName: Binding<String>) {
        _vm = StateObject(wrappedValue: vm)
        _animationName = animationName
    }

    var body: some View {
            VStack {
                ScrollView {
                    VStack(alignment: .center) {
                        HeaderSenseView()
                        InputFieldsCollection()
                            .id(sense.senseOption.rawValue)
                            .padding(.horizontal)
                    }
                }

                Spacer()

                ButtonCustom(
                    backgroundColor: Color("Black"),
                    foregroundColor: Color("White"),
                    font: .body,
                    title: sense.titleNextButton,
                    height: 54
                ) {
                    sense.toggleSense()
                    
                    if sense.isFinished {
                        guard let nextIconName = getNextIconName() else { return }
                        animationName = nextIconName
                    }
                }
                .alert(Text("Save"), isPresented: $sense.isFinished, actions: {
                            Button {
                                buttonSave()
                                dismiss()
                            } label: {
                                Text("Save")
                            }

                            Button("Cancel", role: .cancel) {}
                        }, message: {
                            Text("Do you want to save how often you performed the exercise?")
                })
                .navigationBarTitleDisplayMode(.automatic)
                .padding(.horizontal)
                .onAppear {
                    Task {
                        try await vm.populatePlaces()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func buttonSave() {

        latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0.0
        longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0.0

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

    func verifyList(_ latitudePlace: Double, _ longitudePlace: Double) -> PlaceViewModel? {
        let collection = vm.places
        let filtered = collection.filter {
            $0.latitude.isAlmostEqual(to: latitudePlace, tolerance: 0.0001) &&
            $0.longitude.isAlmostEqual(to: longitudePlace, tolerance: 0.0001)
        }

        if let place = filtered.first {
            return place
            
        } else {
            return nil
        }
    }

    private func getNextIconName() -> String? {
        guard let lastImageIconStringCharacter = animationName.map({String($0)}).last else { return nil }
        guard let lastImageIndex = Int(lastImageIconStringCharacter) else { return nil }
        let nextImageIconIndex = lastImageIndex < 4 ? lastImageIndex + 1 : 4
        return "face_0\(nextImageIconIndex)"
    }
}

