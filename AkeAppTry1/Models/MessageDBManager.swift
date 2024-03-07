//
//  DataBaseManagerPractice.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 19.02.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



enum FetchMessagesError:Error{
    case snapshotError
}

final class MessageDataBaseManagerPractice{
    static let shared = MessageDataBaseManagerPractice()
    
    let messagesRef = Firestore.firestore().collection("messages")
    var listener: ListenerRegistration?

    func listenForNewMessages(completion: @escaping (Result<[Message], FetchMessagesError>) -> Void) {
        // Eğer mevcut bir listener varsa kaldır
        if let existingListener = listener {
            existingListener.remove()
        }
        
        // Yeni listener ekle
        listener = messagesRef.order(by: "createdAt", descending: false)
            .limit(to: 25)
            .addSnapshotListener { [weak self] snapshot, error in
                guard self != nil else { return }
                
                if error != nil {
                    completion(.failure(.snapshotError))
                    return
                }
                
                guard let snapshot = snapshot else {
                    completion(.failure(.snapshotError))
                    return
                }

                var messages = [Message]()

                for doc in snapshot.documents {
                    let data = doc.data()
                    let text = data["text"] as? String ?? ""
                    let userName = data["userName"] as? String ?? ""
                    let userUid = data["userUid"] as? String ?? ""
                    let photoURL = data["photoURL"] as? String ?? ""
                    let createdAt = data["createdAt"] as? Timestamp ?? Timestamp()

                    let msg = Message(userUid: userUid, userName: userName, text: text, photoURL: photoURL, createdAt: createdAt.dateValue())
                    messages.append(msg)
                }

                completion(.success(messages))
            }
    }

    
    func sendMessageToDatabase(message: Message,currentUser:UserModel,completion: @escaping (Bool)-> Void ){
        let data = [
            "text" : message.text,
            "userUid" : message.userUid,
            "photoURL" : currentUser.photoURL as Any,
            "userName" : currentUser.fullName,
            "createdAt" : Timestamp(date: message.createdAt )
        ] as [String:Any]
        
        messagesRef.addDocument(data: data) { error in
            guard error == nil else{
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    
}
