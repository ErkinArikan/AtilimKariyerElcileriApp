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
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search...", text: $text)
                        }.modifier(customViewModifier(roundedCornes: 12, startColor: Color.MyGrayColor, endColor: Color.MyGrayColor, textColor: .accent))
        }.padding(EdgeInsets())
            .padding(.horizontal)
            }
    }


#Preview {
    ZStack(content: {
        Color("MywhiteColor")
        PersonViewSearchbar()
    })
    
}

//struct OvalTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .padding(10)
//            .background(Color.accentColor.opacity(0.7))
//            .cornerRadius(20)
//            .shadow(color: .gray, radius: 10)
//    }
//}

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
            .overlay(content: {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            })
            .font(.custom("Open Sans", size: 18))

            .shadow(color: Color(UIColor.systemGray4).opacity(0.3), radius: 20,x:0,y:20)
    }
}
