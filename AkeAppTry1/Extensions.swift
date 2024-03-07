//
//  ColorExtensions.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation
import SwiftUI

extension Color{
    
   
    static let MyCardTextColor:Color = Color("CardTextColor")
    static let MyCardTextColor2:Color = Color("CardTextColor2")
    static let MyBackgroundColor2:Color = Color("MyBackgroundColor2")
    static let MyGrayColor:Color = Color("myGrayColor")
   
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


extension Color {
    static func hex(_ hex: String) -> Color {
        var cleanedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if cleanedHex.hasPrefix("#") {
            cleanedHex.remove(at: cleanedHex.startIndex)
        }
        var rgb: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        return Color(red: red, green: green, blue: blue)
    }
}
