//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import Foundation


public enum DeviceType: String {
    case iphone
    case ipad
}

public enum DeviceOrientation: String {
    case portrait
    case landscape
}

public enum SubtitleType {
    case standard
    case custom(text: String)
    case none
}
