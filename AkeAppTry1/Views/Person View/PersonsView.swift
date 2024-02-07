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
    
    init() {
        print("Sayfa yaratıldı")
    }
    
    
    // MARK: - Body
    var body: some View {
        
        
        NavigationStack {
            ZStack{
                Color("MywhiteColor").ignoresSafeArea(.all,edges: .all)
                    
                VStack(spacing:0){
                            
                            PersonViewNavbar()
                                .padding(.horizontal)
                            PersonViewSearchbar()
                    
                            PersonListView()
                        } //:Vstack
                        
                        
                        
                    } //:ZStack
                  
                    .listStyle(.plain)
                .environmentObject(vm)
                .scrollIndicators(.hidden)
        }
        

    }
    
}


// MARK: - Preview

#Preview {
    PersonsView()
        
}
