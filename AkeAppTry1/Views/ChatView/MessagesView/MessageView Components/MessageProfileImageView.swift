//
//  MessageProfileImageView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 22.02.2024.
//

import SwiftUI

struct MessageProfileImageView: View {
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    var body: some View {
        if let imageURL = akeLoginViewModel.currentUser?.photoURL{
            Image(imageURL)
                .resizable()
                .scaledToFit()
                .frame(width: 28,height: 28)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 28,height: 28)
                .foregroundStyle(Color(uiColor: .systemGray4))
        }
    }
}

#Preview {
    MessageProfileImageView()
        .environmentObject(AkeLoginViewModel())
}
