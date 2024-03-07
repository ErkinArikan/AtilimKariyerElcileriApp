//
//  LandingPage.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 4.02.2024.
//

import SwiftUI

struct LandingPage: View {
    @EnvironmentObject var personViewModel:MockPersonViewModel
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    
    @State var isActive:Bool = false
   
    
    var body: some View {
        if isActive{
            if akeLoginViewModel.userSession != nil {
                   
                MainView()
                 
            }else{
                MultiSelectionLoginPage()
                    
            }
            
           
        }else{
            NavigationStack {
                ZStack{
                    Color.MyBackgroundColor2
                        .ignoresSafeArea(.all,edges: .all)
                    
                    VStack{
                        Spacer()
                        Image("logo")
                        Spacer()
                        Text("Copy right © reserved by Erkin Arıkan ")
                            .font(.caption2)
                            .foregroundStyle(Color("MyBlackWhiteColor"))
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
        .environmentObject(AkeLoginViewModel())
        .environmentObject(MockPersonViewModel())
}
