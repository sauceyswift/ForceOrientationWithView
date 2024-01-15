//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI

extension RotateYourDeviceViewModifier {
    var iPadOverlay: some View {
        GeometryReader { geo in // only way to tell orientation on ipad
            if (shouldOverlayOnIPad(geoSize: geo.size)) {
                RotateYourDeviceView(
                    rotateTo: rotateTo,
                    deviceType: .ipad,
                    bgColor: bgColor,
                    fontColor: fontColor,
                    subtitle: subtitle
                )
            }
        }
    }
    
    func shouldOverlayOnIPad(geoSize: CGSize) -> Bool {
        let isPortrait = geoSize.width < geoSize.height || horiSizeClass == .compact
        return (rotateTo == .landscape && isPortrait) || (rotateTo == .portrait && !isPortrait)
    }
}
