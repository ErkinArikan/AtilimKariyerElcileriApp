//
//  PersonListView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct PersonListView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @EnvironmentObject var personViewModel:MockPersonViewModel
    @EnvironmentObject var practiceViewModel: PersonViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                ScrollView(showsIndicators:false) {
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15, pinnedViews: [], content: {
                        
                        
                        PersonsFetchedListView()
                        
                        
                    })
                }//:ScrollView
            } //:ZStack
        }//:VStack
        
    }
}

// MARK: - PREVIEW
#Preview {
    PersonListView()
        .environmentObject(AkeLoginViewModel())
        .environmentObject(MockPersonViewModel())
        .environmentObject(PersonViewModel())
}
