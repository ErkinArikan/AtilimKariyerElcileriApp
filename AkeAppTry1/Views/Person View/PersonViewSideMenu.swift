//
//  PersonViewSideMenu.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 8.02.2024.
//

import SwiftUI

struct PersonViewSideMenu: View {
    @Binding var isShowing:Bool
    var body: some View {
        
        
        
            HStack{
                
                VStack(alignment:.leading){
                    
                    Button(action: {
                        isShowing.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    .offset(x:-30,y:-30)
                    Text("Settings")
                        .font(.title)
                        .foregroundStyle(Color.MyCardTextColor)
                        .fontWeight(.bold)
                    
                    Text("sdasf")
                    Spacer()
                } //:VStack
                
              
            
                
                .padding(35)
                .background(Color.MyGrayColor)
                
                
                Spacer()
                
                Button(action: {
                    isShowing.toggle()
                }, label: {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.clear)
                        
                        
                })
                
            }
        
            .offset(x: self.isShowing ? 0 : -UIScreen.main.bounds.width)
            .animation(.easeInOut(duration: 0.5), value: self.isShowing)
            
    
        
        
    }
}

#Preview {
    PersonViewSideMenu(isShowing: .constant(true))
}
