//
//  RotateYourDeviceView.swift
//  Garden Sun Mapper
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI

@MainActor
struct RotateYourDeviceView: View {
    let rotateTo: DeviceOrientation
    let deviceType: DeviceType
    var bgColor: Color = .accentColor
    var fontColor: Color = .white
    var subtitle: SubtitleType = .standard
    
    @State private var curImageName: String = ""
    @State private var rotationAngle: Double = 0
    @State private var iconImageName: String = ""
    @State private var stateImageName: String = "x.circle"
    
    @State private var state: Bool = false
    
    @State private var timer = Timer
        .publish(every: 2.5, on: .main, in: .common)
        .autoconnect()
    
    var rotateFrom: DeviceOrientation {
        rotateTo == .landscape ? .portrait : .landscape
    }
    
    var imageNamePrefix: String {
        "hand_holding_" + deviceType.rawValue + "_"
    }
    var startingImageName: String {
        imageNamePrefix + rotateFrom.rawValue
    }
    var endingImageName: String {
        imageNamePrefix + rotateTo.rawValue + "_rotated"
    }
    
    var defaultSubtitle: String {
        switch subtitle {
        case .standard:
            return "This feature requires that your device be in \(rotateTo.rawValue) orientation."
        case .custom(let text):
            return text
        case .none:
            return ""
        }
    }
    
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            VStack {
                Text("Rotate Your Device")
                    .fgColor(fontColor)
                    .font(.largeTitle.weight(.bold))
                    .padding(10)
                Text(defaultSubtitle)
                    .fgColor(fontColor)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Image(curImageName, bundle: .module)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(rotationAngle))
                Image(systemName: stateImageName)
                    .resizable()
                    .scaledToFit()
                    .fgColor(fontColor)
                    .frame(maxWidth: 80)
                    .padding()
            }
            .padding()
            .onAppear() {
                toggleState(forceState: true)
            }
            .onReceive(timer, perform: { _ in
                toggleState()
            })
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
    }
    
    private func toggleState(forceState: Bool? = nil) {
        if let forceState {
            state = forceState
        } else {
            state.toggle()
        }
        withAnimation(.bouncy(duration: state ? 1.5 : 1)) {
            if state {
                rotationAngle = -90
                curImageName = endingImageName
                stateImageName = "checkmark.circle"
            } else {
                rotationAngle = 0
                curImageName = startingImageName
                stateImageName = "x.circle"
            }
        }
    }
    
}

// MARK: Previews

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
    .forceOrientation(toBe: .portrait, for: [.ipad])
}

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
        .forceOrientation(toBe: .landscape, for: [.ipad])
}

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
        .forceOrientation(toBe: .landscape, for: [.ipad, .iphone])
}

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
        .forceOrientation(toBe: .portrait, for: [.ipad, .iphone])
}

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
        .forceOrientation(toBe: .portrait, for: [.iphone])
}

#Preview {
    Button(action: { print("clicked!") }, label: { Rectangle().ignoresSafeArea() })
        .forceOrientation(toBe: .landscape, for: [.iphone])
}
