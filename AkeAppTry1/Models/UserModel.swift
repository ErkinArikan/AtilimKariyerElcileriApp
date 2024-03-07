//
//  UserModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 17.02.2024.
//

import Foundation

struct UserModel : Identifiable,Codable{
    let id:String
    let fullName:String
    let email:String?
    let photoURL:String? 
    /*buraya bir renk ekleyelim string olsun 
     let personColor:String // hex şeklinde gelicekler ve onu kullanabilicem.
     
     */
    
    
    func fetctPhotoURL()-> URL?{
        guard let photoURLString = photoURL, let url = URL(string: photoURLString) else{
           return nil
        }
      return url
    }
}
