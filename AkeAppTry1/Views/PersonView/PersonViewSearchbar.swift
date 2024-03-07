//
//  PersonViewSearchbar.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct PersonViewSearchbar: View {
    // MARK: - PROPERTIES
    
    @State var textField:String = ""
    @EnvironmentObject var practiceViewModel:PersonViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            
          myTextField
                .submitLabel(.return)
                .onSubmit {
                    hideKeyboard()
                }
            
        }//:VStack
        .padding(EdgeInsets())
        .padding(.horizontal)
    } //:body
}

// MARK: - PREVIEW
#Preview {
    ZStack(content: {
        Color("MywhiteColor")
        PersonViewSearchbar()
            .environmentObject(PersonViewModel())
    })
    
}

// MARK: - EXTENSION
extension PersonViewSearchbar{
    // MARK: - myTExtField
    private var myTextField:some View{
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color("FullMyBlueColor"))
            TextField("", text: $textField)
                .placeholder(when: textField.isEmpty) { // placeholder özelliğini kullanıyoruz
                    Text("Arama Yap")
                        .foregroundColor(Color("FullMyBlueColor"))
                        .font(.body)
                        .onChange(of: textField) { newValue in
                            practiceViewModel.filterData(with: newValue)
                        }
                } //: TextField
            
        } //:HStack
        .modifier(customViewModifier(roundedCornes: 12, startColor: Color.MyGrayColor, endColor: Color.MyGrayColor, textColor: .accent))
        
    }
}


// MARK: - CUSTOM TEXTFIELD ATTRIBUTES
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
            .foregroundColor(textColor)
            .overlay(content: {
                RoundedRectangle(cornerRadius:12, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            })
            .font(.custom("Open Sans", size: 18))

            .shadow(color: Color(UIColor.systemGray4).opacity(0.3), radius: 20,x:0,y:20)
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
