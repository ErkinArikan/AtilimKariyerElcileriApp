//
//  Globals.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import Foundation
import SwiftUI


//let examplePersonObj = PersonModel(name: "Erkin", akeTitle: "Kariyer Elçisi", major: "Yazılım Mühendisliği", studentYear: 3, workYear: 1, image: "ErkinPNG")

let examplePersonObj = PersonModel(name: "Alperen", fullName: "Alperen Peker", akeTitle: "Kıdemli kariyer Elçisi", major: "Mekatronik Mühendisliği", doubleMajor: " / Elektrik Elektronik Mühendisliği (ÇAP)",  image: "Alperen Peker",bacwardImage: "AlperenCircleSS")

//Lazy VGrid
let columnSpace:CGFloat = 10
let rowSpace:CGFloat = 10

// bu kaçarlı ızgara yaratmak istediğimizi söylüyor
var gridLayout:[GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpace), count: 1)
}

