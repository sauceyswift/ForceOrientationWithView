//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import Foundation


enum DeviceType: String {
    case iphone
    case ipad
}

enum DeviceOrientation: String {
    case portrait
    case landscape
}

enum SubtitleType {
    case standard
    case custom(text: String)
    case none
}
