//
//  File.swift
//  
//
//  Created by Michael Ceryak on 1/14/24.
//

import SwiftUI

extension View {
    
    func fgColor(_ color: Color) -> some View {
        if #available(iOS 17, *) {
            return self.foregroundStyle(color)
        }
        return self.foregroundColor(color)
    }
    
}
