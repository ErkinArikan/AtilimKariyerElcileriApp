//
//  HomeViewNavBar.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct PersonViewNavbar: View {
    
    // MARK: - Properties
    @State var isAnimating:Bool = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            // MARK: - left button
            Button(action: {
                
            }, label: {
               Image(systemName: "square.stack.3d.down.forward.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .offset(x:isAnimating ? 0:-50)
                    .scaleEffect(isAnimating ? 1:0.8)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
            }) // Left Button
            
            
            Spacer()
            // MARK: - Icon
            
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 95)
                .offset(y:isAnimating ? 0:-25)
                .opacity(isAnimating ? 1:0)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
                .shadow(color:.white,radius: 10)
            
            
            Spacer()
            
            // MARK: - Right button
            Button(action: {
                
            }, label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .offset(x:isAnimating ? 0:50)
                    .scaleEffect(isAnimating ? 1:0.8)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
            })
            
            
            
        } //:Hstack
        
        .onAppear(perform: {
            isAnimating = true
        })
        .padding(.horizontal)
    }
}

#Preview {
    ZStack(content: {
        Color.MyWhiteColor.ignoresSafeArea(.all,edges: .all)
        PersonViewNavbar()
    })
    
}
