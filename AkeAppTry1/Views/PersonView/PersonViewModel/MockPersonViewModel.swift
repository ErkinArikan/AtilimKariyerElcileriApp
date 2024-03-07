//
//  PersonViewModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation



class MockPersonViewModel:ObservableObject{
    
    @Published var  person:[MockPersonModel] = []
    
    
    init() {
        getPerson()
    }
    
    func getPerson(){
        let p1 = MockPersonModel(name: "Erkin", fullName: "Erkin Arıkan", akeTitle: "Kariyer Elçisi", major: "Yazılım Mühendisliği",  image: "ErkinPNG", bacwardImage: "ErkinBack")
        
//        let p2 = PersonModel(name: "Melisa", akeTitle: "Kıdemli Kariyer Elçisi", major: "Uluslararası Ticaret ve Lojistik", image: "Melisa")
        
        let p3 = MockPersonModel(name: "Alperen", fullName: "Alperen Peker", akeTitle: "Kıdemli Kariyer Elçisi", major: "Mekatronik Mühendisliği", doubleMajor: " / Elektrik Elektronik Mühendisliği (ÇAP)", image: "Alperen Peker", bacwardImage: "BerkÇelikBack")
        
        person.append(contentsOf: [p1, p3])
    }
    
}
