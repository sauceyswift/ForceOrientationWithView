//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI

extension View {
    
    public func forceOrientation(
        toBe orientation: DeviceOrientation,
        for device: DeviceType,
        overlayBackgroundColor: Color = .accentColor,
        overlayFontColor: Color = .white,
        overlaySubtitle: SubtitleType = .standard
    ) -> some View {
        self.modifier(
            RotateYourDeviceViewModifier(
                rotateTo: orientation,
                deviceType: device,
                bgColor: overlayBackgroundColor,
                fontColor: overlayFontColor,
                subtitle: overlaySubtitle
            )
        )
    }
    
    
    
}



// not to be called directly, outside of this file!



