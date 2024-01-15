//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import Foundation

extension Array where Element == DeviceType {
    
    public static var all: [DeviceType] { [.iphone, .ipad] }
    public static var iphone: [DeviceType] { [.iphone] }
    public static var ipad: [DeviceType] { [.ipad] }
    
}
