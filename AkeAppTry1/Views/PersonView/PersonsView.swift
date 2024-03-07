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
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @EnvironmentObject var personViewModel:MockPersonViewModel
    @EnvironmentObject var practiceViewModel: PersonViewModel
    @State var isAnimating:Bool = false
    
    @State var isShowing:Bool = false
    
    
    // MARK: - Body
    var body: some View {
        
        
        NavigationStack {
            ZStack{
                //Background
                Color("MyBackgroundColor2").ignoresSafeArea(.all,edges: .all)
                
                VStack(spacing:0){
                    PersonViewSearchbar()
                    PersonsFetchedListView()
                } //:Vstack
            }
            .background(Color.black.opacity(isShowing ? 0.5:0))
            
        } //:ZStack
        
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}




// MARK: - Preview

#Preview {
    PersonsView()
        .environmentObject(AkeLoginViewModel())
        .environmentObject(MockPersonViewModel())
        .environmentObject(PersonViewModel())
    
}







