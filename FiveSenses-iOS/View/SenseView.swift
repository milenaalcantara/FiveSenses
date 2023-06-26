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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HeaderSenseView()
                
                InputFieldsCollection()
                    .id(sense.senseOption.rawValue)
                    .padding(.horizontal)
                
                Spacer()
                
                ButtonCustom(
                    backgroundColor: .black,
                    foregroundColor: .white,
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
                .alert(Text("Salvar"), isPresented: $sense.isFinished, actions: {
                            Button {
                                buttonSave()
                                dismiss()
                            } label: {
                                Text("Salvar")
                            }

                            Button("Cancel", role: .cancel) {}
                        }, message: {
                            Text("Deseja salvar a frequência que você realizou o exercício?")
                })
                .padding()
//
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
            $0.latitude.isAlmostEqual(to: latitudePlace, tolerance: 0.00001) &&
            $0.longitude.isAlmostEqual(to: longitudePlace, tolerance: 0.00001)
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

