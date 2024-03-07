//
//  GuestMessageView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 18.02.2024.
//

import SwiftUI

struct GuestMessageView: View {
    var body: some View {
        ZStack{
            Color.myBackGround
            
            Text("Mesajları sadece Kariyer Elçisi Üyeleri görebilmektedi.")
                .padding()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .background(Color(uiColor: UIColor.systemGray6))
                .padding()
                .shadow(radius: 10)
            
        }
    }
}

#Preview {
    GuestMessageView()
}
