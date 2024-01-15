//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI


extension RotateYourDeviceViewModifier {
    var iPhoneOverlay: some View {
        shouldOverlayOnIPhone()
        ? RotateYourDeviceView(
            rotateTo: rotateTo,
            deviceType: .iphone,
            bgColor: bgColor,
            fontColor: fontColor,
            subtitle: subtitle
        )
        : nil
    }
    
    func shouldOverlayOnIPhone() -> Bool {
        (rotateTo == .landscape && isPortraitPhone)
        ||
        (rotateTo == .portrait && isLandscapePhone)
    }
}
