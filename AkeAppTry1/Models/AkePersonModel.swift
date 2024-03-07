//
//  AkePersonModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 29.02.2024.
//

import Foundation

struct AkePersonModel:Identifiable,Codable{
    var id :String
    let name: String
    let fullName:String
    let akeTitle:String
    let major:String
    let doubleMajor:String?
    let image:String?
    let backwardImage:String?
    let linkedinURL:String?
    
    func fetctPhotoURL()-> URL?{
        guard let photoURLString = image, let url = URL(string: photoURLString) else{
            return nil
        }
        return url
    }
    
    func fetctBackPhotoURL()-> URL?{
        guard let photoURLString = backwardImage, let url = URL(string: photoURLString) else{
            return nil
        }
        return url
    }
}
