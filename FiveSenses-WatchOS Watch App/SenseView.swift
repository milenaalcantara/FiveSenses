//
//  SenseView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI
import MapKit
import CloudKit


struct SenseView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var sense: Sense

    @StateObject var locationDataManager = LocationDataManager()
    @StateObject var vm: PlaceListViewModel

    @State private var pulse: CGFloat = 1
    @State private var isEnabledButton: Bool = true
    @State private var isFinished: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    
    var body: some View {
        HStack {
            VStack {
                textSense
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 20)
                
                ImageCustomView()
                    .frame(width: 36)
                    .onReceive(timer) { _ in
                        if timeElapsed == sense.numberOfSenses {
                            if timeElapsed > 1 {
                                withAnimation {
                                    isEnabledButton.toggle()
                                }
                            } else {
                                buttonSave()
                                isFinished = true
                            }
                        }
                        timeElapsed = 1 + timeElapsed
                    }
                
                Spacer(minLength: 20)
                
                NextSenseButton
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
    }
    
    var NextSenseButton: some View {
        Button {
            switch sense.senseOption {
            case .vision:
                isEnabledButton.toggle()
                sense.senseOption = .hearing
                timeElapsed = 0
                return
            case .hearing:
                isEnabledButton.toggle()
                sense.senseOption = .feel
                timeElapsed = 0
                return
            case .feel:
                isEnabledButton.toggle()
                sense.senseOption = .smell
                timeElapsed = 0
                return
            case .smell:
                isEnabledButton.toggle()
                sense.senseOption = .palate
                timeElapsed = 0
                return
            case .palate:
                dismiss()
                isFinished = true
                return
            }
        } label: {
            Text(isFinished ? "Finalizar" : "Próximo")
                .font(.body)
                .foregroundColor(.black )
                
        }
        .frame(height: 36)
        .background(.white )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .disabled(isEnabledButton)
        .padding(.horizontal, 20)
        .opacity(isEnabledButton ? 0 : 1)
    }
    
    var textSense: some View {
        Text(sense.watchDescription)
            .font(.footnote)
            .padding()
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
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
