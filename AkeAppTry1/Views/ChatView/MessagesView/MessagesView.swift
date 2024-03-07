//
//  MessagesViewPractice.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 19.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessagesView: View {
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel

  
    var message:Message
    

    var body: some View {
        
        HStack{
            if akeLoginViewModel.isFromCurrentUser(message: message){
                Spacer()
                Text(message.text)
                    .font(.subheadline)
                    .foregroundStyle(Color("myTextFieldColor"))
                    .padding(12)
                    .background(Color(.systemBlue))
                    .clipShape(MessageBubble(isFromCurrentUser: akeLoginViewModel.CurrentUserValid()))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5,alignment: .trailing)
            } //:if
            else{
                HStack(alignment:.bottom, spacing: 8){
                    
                    if let photoURL = message.fetctPhotoURL(){
                        WebImage(url: photoURL)
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
                    VStack(alignment:.leading,spacing:5,content: {
                        Text((message.userName))
                            .foregroundStyle(Color.MyCardTextColor2)
                        Text("\(message.text)")
                            
                           
                    })
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray5))
                    .foregroundStyle(Color("MyBlackWhiteColor"))
                    .clipShape(MessageBubble(isFromCurrentUser:false))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.75,alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal,8)

    }
}

#Preview {
    MessagesView(message: Message(userUid: "123", userName: "Random name gelicek", text: "Hello every one deneme mesajı nekadar uzun bakalım ", photoURL: " ", createdAt: Date()))
        .environmentObject(AkeLoginViewModel())
}






extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0..<1)
        let green = Double.random(in: 0..<1)
        let blue = Double.random(in: 0..<1)
        return Color(red: red, green: green, blue: blue)
    }
}
