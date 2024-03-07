////
////  ChatViewPracticeModel.swift
////  AkeAppTry1
////
////  Created by BLG-BC-003 on 19.02.2024.
////
////
////import Foundation
////import SwiftUI
////
////class ChatViewModel:ObservableObject{
////    @Published var messages:[Message]  = []
////    //@EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
////
////    
////    init() {
////        MessageDataBaseManagerPractice.shared.listenForNewMessages{[weak self] result in
////            DispatchQueue.main.async {
////                switch result {
////                case .success(let messages):
////                    self?.messages = messages
////                case .failure(let error):
////                    print(error)
////                    // Hata durumunda ne yapılacağını burada işleyebilirsiniz.
////                }
////            }
////        }
////    }
//
////    func getMessages(){
////        let messageArray:[Message] = [  Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()),  Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()),Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()), Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()),Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()),Message(userUid: "123124", text: "Merhaba asfbsdkfbsdhg", photoURL:"", createdAt: Date()),]
////        
////        messages.append(contentsOf: messageArray)
////        
////        
////        
////    }
//    
//    
//    
//}
