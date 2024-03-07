//
//  ActivitiyView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 3.02.2024.
//

import SwiftUI

struct CalenderView: View {
    // MARK: - PROPERTIES
    
    
    // MARK: -BODY
    var body: some View {
        NavigationStack{
            ZStack{
                Color.MyBackgroundColor2.ignoresSafeArea(.all,edges: .all)
              
                VStack{
                    Text("Takvim Sayfası")
                        
                    Spacer()
                }
                
            }
            
            
        } //:NavStack
    }
}


// MARK: -PREVIEW
#Preview {
    CalenderView()
}
