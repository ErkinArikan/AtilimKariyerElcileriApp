//
//  HomeView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct HomeView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    
    //MARK: - BODY
    var body: some View {
        
        VStack(alignment:.leading){
            
            HStack {
                Text("AKE'de Gündem")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(x:-50)
                .padding()
                
                

            }
            Spacer()
            
           
            
        } //:VStack
       
        
        
        
        
    }//:Body
}


//MARK: -  PREVIEW
#Preview {
    HomeView()
}
