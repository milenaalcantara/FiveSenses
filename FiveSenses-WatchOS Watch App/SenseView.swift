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
    @State private var isVisibleButton: Bool = false
    @State private var isFinished: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var latitude = CLLocationDegrees()
    @State var longitude = CLLocationDegrees()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ZStack {
                        animationCircle
                            .frame(
                                width: geometry.size.width * 0.5,
                                height: geometry.size.width * 0.5
                            )
                        buttonTypes
                        if isFinished {
                            navigationFinish
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.8)
                textSense
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }

    var animationCircle: some View {

        Circle()
            .foregroundColor(sense.color.opacity(0.9))
            .scaleEffect(pulse)
            .shadow(color: sense.color, radius: 14)
            .onAppear{
                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.25)) {
                    pulse = 1.2 * pulse
                }
            }
            .onReceive(timer) { _ in
                if timeElapsed == (sense.numberOfSenses) {
                    if timeElapsed > 1 {
                        isVisibleButton.toggle()
                    } else {
                        buttonSave()
                        isFinished = true
                    }
                }
                timeElapsed = 1 + timeElapsed
            }
    }
    var buttonTypes: some View {
        Button {
            switch sense.senseOption {
            case .vision:
                isVisibleButton.toggle()
                sense.senseOption = .hearing
                timeElapsed = 0
                return
            case .hearing:
                isVisibleButton.toggle()
                sense.senseOption = .feel
                timeElapsed = 0
                return
            case .feel:
                isVisibleButton.toggle()
                sense.senseOption = .smell
                timeElapsed = 0
                return
            case .smell:
                isVisibleButton.toggle()
                sense.senseOption = .palate
                timeElapsed = 0
                return
            case .palate:
                return
            }
        } label: {
            Image(systemName: "arrow.forward.circle")
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.8))
                .background(.clear)
        }
        .background(.clear)
        .frame(width: 60, height: 60)
        .hiddenConditionally(isHidden: !isVisibleButton)
    }
    var navigationFinish: some View {
        NavigationLink {
            FinishView()
        } label: {
            Image(systemName: "arrow.forward.circle")
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.8))
                .background(.clear)
        }
        .frame(width: 60, height: 60)
    }
    var textSense: some View {
        Text(sense.watchDescription)
            .font(.footnote)
    }

    func buttonSave() {

        latitude = locationDataManager.location?.coordinate.latitude ?? 0.0
        longitude = locationDataManager.location?.coordinate.longitude ?? 0.0

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
