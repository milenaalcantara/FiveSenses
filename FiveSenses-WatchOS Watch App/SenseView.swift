//
//  SenseView.swift
//  FiveSenses-WatchOS Watch App
//
//  Created by Milena Lima de Alcântara on 06/06/23.
//

import SwiftUI

struct SenseView: View {
    @EnvironmentObject var sense: Sense
    @State private var pulse: CGFloat = 1
    @State private var isVisibleButton: Bool = false
    @State private var isFinished: Bool = false
    @State var timeElapsed: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(
                                width: geometry.size.width * 0.5,
                                height: geometry.size.width * 0.5
                            )
                            .foregroundColor(sense.color.opacity(0.9))
                            .scaleEffect(pulse)
                            .shadow(color: sense.color, radius: 14)
                            .onAppear {
                                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.25)) {
                                    pulse = 1.2 * pulse
                                }
                            }
                            .onReceive(timer) { _ in
                                if timeElapsed == (sense.numberOfSenses) {
                                    if timeElapsed > 1 {
                                        isVisibleButton.toggle()
                                    } else {
                                        isFinished = true
                                    }
                                }
                                timeElapsed = 1 + timeElapsed
                            }
                        
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
                        
                        if isFinished {
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
                        
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.8)
                
                Text(sense.watchDescription)
                    .font(.footnote)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct SenseView_Previews: PreviewProvider {
    static var previews: some View {
        SenseView()
    }
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
