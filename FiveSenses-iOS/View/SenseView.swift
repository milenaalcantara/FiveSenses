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

    @Binding var imageIcon: String

    @StateObject var locationDataManager = LocationDataManager()
    @StateObject var vm: PlaceListViewModel

    @State private var isFinished: Bool = false
    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    @State var title = "Próximo"
    let container = CKContainer(identifier: "iCLoud.locaisVisitados")

    init(vm: PlaceListViewModel, imageIcon: Binding<String>) {
        _vm = StateObject(wrappedValue: vm)
        _imageIcon = imageIcon
    }

    var body: some View {
        NavigationView {
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
                    title: title,
                    height: 54
                ) {
                    switch sense.senseOption {
                    case .vision:
                        if sense.areEmptyFields {
                            sense.senseOption = .hearing
                            sense.isChangedSense = true
                            return
                        }
                    case .hearing:
                        if sense.areEmptyFields {
                            sense.senseOption = .feel
                            sense.isChangedSense = true
                            return
                        }
                    case .feel:
                        if sense.areEmptyFields {
                            sense.senseOption = .smell
                            sense.isChangedSense = true
                            return
                        }
                    case .smell:
                        if sense.areEmptyFields {
                            sense.senseOption = .palate
                            sense.isChangedSense = true
                            title = "Finished"
                            return
                        }
                    case .palate:
                        if !sense.areEmptyFields {
                            guard let nextIconName = getNextIconName() else { return }
                            isFinished = true
                            imageIcon = nextIconName
                            return
                        }
                    }
                }
                .alert(Text("Salvar"), isPresented: $isFinished, actions: {
                    Button {
                        buttonSave()
                        dismiss()
                    } label: {
                        Text("Salvar")
                    }

                    Button("Cancel", role: .cancel) {

                    }

                }, message: {
                    Text("Deseja salvar a frequência que você realizou o exercício?")
                })
                .padding(.horizontal)
                .onAppear {
                    Task {
                        try await vm.populatePlaces()
                    }
                }
            }
        }

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
            $0.latitude.isAlmostEqual(to: latitudePlace, tolerance: 0.000001) &&
            $0.longitude.isAlmostEqual(to: longitudePlace, tolerance: 0.000001)
        }

        if let place = filtered.first {
            return place
            
        } else {
            return nil
        }
    }

    private func getNextIconName() -> String? {
        guard let lastImageIconStringCharacter = imageIcon.map({String($0)}).last else { return nil }
        guard let lastImageIndex = Int(lastImageIconStringCharacter) else { return nil }
        let nextImageIconIndex = lastImageIndex < 4 ? lastImageIndex + 1 : 4
        return "face0\(nextImageIconIndex)"
    }
}

