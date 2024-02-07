//
//  PersonViewSearchbar.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct PersonViewSearchbar: View {
    @State var text = ""
    @State var textField:String = ""
    var body: some View {
//        HStack{
//           
//            Image(systemName: "magnifyingglass")
//            TextField("", text: $textField,prompt: Text("Enter here...").foregroundStyle(.white.opacity(0.7)))
//           
//                
//               
//        }
//        .textFieldStyle(OvalTextFieldStyle())
//        .padding()
//        
        VStack(alignment: .leading) {
                        Text("Outlined Custom TextField Style").font(.title2)
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search...", text: $text)
                        }.modifier(customViewModifier(roundedCornes: 6, startColor: .orange, endColor: .purple, textColor: .white))
                    }.padding()
            }
    }


#Preview {
    ZStack(content: {
        Color("MywhiteColor")
        PersonViewSearchbar()
    })
    
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.accentColor.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))

            .shadow(radius: 10)
    }
}
