//
//  PersonsView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation
import SwiftUI

struct PersonsView: View {
    
    // MARK: - Properties
    @StateObject var vm = PersonViewModel()
    @State var isAnimating:Bool = false
    
    @State var isShowing:Bool = false
    
    
    // MARK: - Body
    var body: some View {
        
        
        NavigationStack {
            ZStack{
                Color("MywhiteColor").ignoresSafeArea(.all,edges: .all)
                    
                VStack(spacing:0){
                            
//                            PersonViewNavbar()
//                                .padding(.horizontal)

                    
                    
                            PersonViewSearchbar()
                    
                            PersonListView()
                        } //:Vstack
                
                GeometryReader{_ in
                    PersonViewSideMenu(isShowing: $isShowing)
                        .offset(x: self.isShowing ? 0 : -UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.5), value: self.isShowing)
                    
                }
                .background(Color.black.opacity(isShowing ? 0.5:0))
                        
               
                        
                    } //:ZStack
                  
                    .listStyle(.plain)
                .environmentObject(vm)
                .scrollIndicators(.hidden)
                .onAppear(perform: {
                    isAnimating = true
                })
        }
        

    }
    
}


// MARK: - Preview

#Preview {
    PersonsView()
        
}







