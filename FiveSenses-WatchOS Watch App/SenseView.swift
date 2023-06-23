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
                        if timeElapsed == (sense.numberOfSenses) {
                            if timeElapsed > 1 {
                                isEnabledButton.toggle()
                            } else {
                                buttonSave()
                                isFinished = true
                            }
                        }
                        timeElapsed = 1 + timeElapsed
                    }
                
                Spacer(minLength: 20)
                
                NextSenseButton
                    
                
                if isFinished {
                    navigationFinish
                }
            }
        }
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
                return
            }
        } label: {
//            Image(systemName: "arrow.forward.circle")
            Text("Próximo")
                .font(.body)
                .foregroundColor(isEnabledButton ? .black.opacity(0.9) : .black )
                
        }
        .frame(height: 36)
        .background(isEnabledButton ? .white.opacity(0.5) : .white )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .disabled(isEnabledButton)
        .padding(.horizontal, 20)
    }
    
    var navigationFinish: some View {
        NavigationLink {
            FinishView()
        } label: {
            Image(systemName: "arrow.forward.circle")
                .font(.largeTitle)
                .foregroundColor(.black)
                .background(Color.primary)
        }
        .frame(height: 20)
        
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
