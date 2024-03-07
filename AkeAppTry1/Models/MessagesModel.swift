//
//  MessagesModelPractice.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 19.02.2024.
//

import Foundation
enum MessageError:Error{
        case noPhotoURL
    }


struct Message:Identifiable,Codable,Equatable{
    var id = UUID().uuidString
    let userUid:String
    let userName:String
    let text:String
    let photoURL:String?
    let createdAt:Date
    
    // buraya renk eklenilcek
    #warning("Renk gelicek buraya userdan gelen renki burada send ile yollayacağız sonra çekeceğiz.Unutma")
    
    
    func fetctPhotoURL()-> URL?{
        guard let photoURLString = photoURL, let url = URL(string: photoURLString) else{
           return nil
        }
      return url
    }
        
    
}
