//
//  PersonViewModel.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 29.02.2024.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

// MARK: - VIEWMODEL
class PersonViewModel: ObservableObject {
    @Published var personArr = [AkePersonModel]()
    
    @Published var filteredPersonArr = [AkePersonModel]()
    
    @Published var dataFetched = false // Verinin alınıp alınmadığını izlemek için flag
    
    
    init() {
        getData()
        
    }
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("persons").getDocuments { snapshot, error in
            if let error = error {
                print("Veri alınamadı: \(error.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                
                DispatchQueue.main.async{ [weak self] in
                    self?.personArr = snapshot.documents.map { document in
                        let data = document.data()
                        
                        let id = document.documentID
                        
                        let name = data["name"] as? String ?? ""
                        
                        let fullName = data["fullName"] as? String ?? ""
                        let akeTitle = data["akeTitle"] as? String ?? ""
                        
                        let major = data["major"] as? String ?? ""
                        
                        let image = data["image"] as? String ?? ""
                        
                        let backwardImage = data["backwardImage"] as? String ?? ""
                        let doubleMajor = data["doubleMajor"] as? String ?? ""
                        let linkedinURL = data["linkedinURL"] as? String ?? ""
                        
                        
                        return AkePersonModel(id: id, name: name, fullName: fullName, akeTitle: akeTitle, major: major,doubleMajor: doubleMajor, image: image, backwardImage: backwardImage, linkedinURL: linkedinURL)
                    }
                    self?.dataFetched = true // Verinin başarıyla alındığını işaretleyin
                    self?.updateFilteredArray()
                }
            }
        }
    }
    
    func updateFilteredArray(){
        
        filteredPersonArr = personArr.sorted(by: { (user1, user2)->Bool in
            return user1.name > user2.name
        })
        print("filteredPersonArr: \(filteredPersonArr)")
    }
    // Metin aramasına göre verileri filtrele
      func filterData(with searchText: String) {
          if searchText.isEmpty {
              // Eğer arama metni boşsa, filtreyi kaldır ve tüm verileri göster
              filteredPersonArr = personArr
          } else {
              // Aksi halde, arama metniyle eşleşen verileri filtrele
              filteredPersonArr = personArr.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.fullName.lowercased().contains(searchText.lowercased()) }
          }
      }
    
}
