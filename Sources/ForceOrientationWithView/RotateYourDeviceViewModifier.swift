//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI

struct RotateYourDeviceViewModifier: ViewModifier {
    @Environment(\.horizontalSizeClass) internal var horiSizeClass
    @Environment(\.verticalSizeClass) internal var vertiSizeClass
    
    var isIPad: Bool { horiSizeClass == .regular && vertiSizeClass == .regular }
    var isPhone: Bool { !isIPad }
    var isPortraitPhone: Bool { horiSizeClass == .compact && vertiSizeClass == .regular }
    var isLandscapePhone: Bool { isPhone && !isPortraitPhone }
    var isMac: Bool { ProcessInfo.processInfo.isiOSAppOnMac }
    
    let rotateTo: DeviceOrientation
    let deviceType: DeviceType
    let bgColor: Color
    let fontColor: Color
    let subtitle: SubtitleType
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isMac {
                // do nothing
            } else if isPhone && deviceType == .iphone {
                iPhoneOverlay
            } else if isIPad && deviceType == .ipad {
                iPadOverlay
            }
        }
    }
    
}
