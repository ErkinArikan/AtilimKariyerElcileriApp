//
//  PersonViewModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation


class PersonViewModel:ObservableObject{
    
    @Published var  person:[PersonModel] = []
    
    
    init() {
        getPerson()
    }
    
    func getPerson(){
        let p1 = PersonModel(name: "Erkin", fullName: "Erkin Arıkan", akeTitle: "Kariyer Elçisi", major: "Yazılım Mühendisliği",  image: "ErkinPNG", bacwardImage: "ErkinBack")
        
//        let p2 = PersonModel(name: "Melisa", akeTitle: "Kıdemli Kariyer Elçisi", major: "Uluslararası Ticaret ve Lojistik", image: "Melisa")
        
        let p3 = PersonModel(name: "Alperen", fullName: "Alperen Peker", akeTitle: "Kıdemli Kariyer Elçisi", major: "Mekatronik Mühendisliği", doubleMajor: " / Elektrik Elektronik Mühendisliği (ÇAP)", image: "Alperen Peker", bacwardImage: "AlperenBack")
        
        person.append(contentsOf: [p1, p3])
    }
    
}
