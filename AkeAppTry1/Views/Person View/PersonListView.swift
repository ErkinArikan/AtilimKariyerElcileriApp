//
//  PersonListView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct PersonListView: View {
    @EnvironmentObject var vm :PersonViewModel
    
    
    var body: some View {
        
//        HStack(alignment:.center,spacing: 0){

//
//
//            VStack(alignment:.leading,spacing: 0){
//                Text(person.name)
//                    .font(.headline)
//            }
//            Spacer()
//
//        } //:Hstack
//        .frame(width: 400)
        
        
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15, pinnedViews: [], content: {
                
                ForEach(vm.person){persons in
                    PersonListRowView(person: persons)
                        .padding(.top)
                }
               
                
            })
        } //:ScrollView
    }
}

#Preview {
    PersonListView()
        .environmentObject(PersonViewModel())
}
