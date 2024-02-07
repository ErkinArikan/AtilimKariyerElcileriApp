//
//  PersonModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation


// bir ake modeli bu. Herkesin nelere sahip olabiliceğini bir düşün
class PersonModel:Identifiable{
   
    let id = UUID().uuidString
    let name: String
    let fullName:String
    let akeTitle:String
    let major:String
    let doubleMajor:String?
    let image:String
    let backwardImage:String
    let linkedinURL:String?
    
    init(name: String = "",fullName:String = "", akeTitle: String = "", major: String = "", doubleMajor: String? = "", image: String = "", bacwardImage: String = "",linkedinURL:String = "") {
        self.name = name
        self.akeTitle = akeTitle
        self.major = major
        self.doubleMajor = doubleMajor
        self.image = image
        self.backwardImage = bacwardImage
        self.fullName = fullName
        self.linkedinURL = linkedinURL
    }
    
}
