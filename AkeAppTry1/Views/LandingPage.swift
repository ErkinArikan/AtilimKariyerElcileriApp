//
//  LandingPage.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 4.02.2024.
//

import SwiftUI

struct LandingPage: View {
    
    @State var isActive:Bool = false
    var body: some View {
        if isActive{
            MainView()
        }else{
            NavigationStack {
                ZStack{
                    Color("MywhiteColor")
                        .ignoresSafeArea(.all,edges: .all)
                    
                    VStack{
                        Spacer()
                        Image("logo")
                        Spacer()
                        Text("Copy right © reserved by Erkin Arıkan ")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    
                }
            } //:NavStack
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
        
    }
}

#Preview {
    LandingPage()
}
