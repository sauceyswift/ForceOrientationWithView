//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import Foundation

extension Array where Element == DeviceType {
    
    static var all: [DeviceType] { [.iphone, .ipad] }
    static var iphone: [DeviceType] { [.iphone] }
    static var ipad: [DeviceType] { [.ipad] }
    
}
