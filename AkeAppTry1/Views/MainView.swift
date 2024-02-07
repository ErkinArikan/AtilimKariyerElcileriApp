//
//  ContentView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import SwiftUI

struct MainView: View {
    

    #warning("onboarding view yapabiliriz bir de")
    #warning(" 1- Neden bu appi yaptığımızı bir şekilde anlatmalıyız ( bir soru işareti ekleyere) bir açılır pencere ile şefaf olabilir yandan geir ")
    #warning("ake sembolunu shadow rengini bir ternary operator ile kullanabiliriz eğer karanlık olursa beyaz gölge gibi")
    #warning("2- List görünümünü güzelleştirebiliriz backgroundu sadece beyaz olarak mı seçsek ? bu tarz soruları düşün bi.")
    #warning("Kesinlikle kendi tabviewını yap çorla gitsin bir yerden")
    #warning("3- PeopleDetailView'ı tasarla")
    #warning("4- Navbar kendin tasarla")
    #warning("5- bi landing pagelere bak kendin tasarla launch screeni de")
    #warning("Animasyonlar, transitionlar ekle")
    #warning("Diğer yaptığın bütün uygulamalrın hepsiiiine tek tek göz gezdir neler yapmışsın tekrar tekrar oku buraya ekleyelim")
    #warning("havalı bir tabView istersek yapabiliriz opsyonel olsun")
    #warning("kişiler detay sayfasında herkesin linkedinleri bilgileri yer alır hangi bölüm vs fotoğrafları da bulunur.")
    #warning("Atılım blink uygulmasından bakarak çorlayabiliriz accık uygulamalara bak çorla ingilizcesini de ekleyebiliriz o nasıl oluyor bakaraız bi. ")
    #warning("Kesinlikle kendi tabviewını yap çorla gitsin bir yerden")
    
    @State var selectedTab:Tab = .person
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("MywhiteColor")], startPoint:.top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all)
                VStack {
                    if selectedTab == .person {
                        PersonsView()
                            
                    }
                    
                    if selectedTab == .house{
                        HomeView()
                    }
                    
                    if selectedTab == .leaf {
                        ActivitiyView()
                    }
                    
                    Spacer()
                    
                    CustomTabView(selectedTab: $selectedTab)
                        .padding(EdgeInsets())
                        
                        
                    
                }
            }
        }
        

        
        
    }
}

#Preview {
    MainView()
}


//        TabView(selection: $selectedTab){
//
//
//            PersonsView()
//                .tabItem {
//
//                    Image(systemName: "graduationcap.fill")
//
//
//                    Text("ELÇİLER")
//
//                }
//                .tag(2)
//
//            HomeView()
//                .tabItem {
//                    Image(systemName: "house.fill")
//
//
//                    Text("Ev".uppercased())
//                }
//                .tag(1)
//
//
//            ActivitiyView()
//                .tabItem {
//                    Image(systemName: "character.book.closed.fill")
//
//                    Text("Aktiviteler".uppercased())
//
//                }
//                .tag(3)
//
//
//        }
//        .tint(Color.accentColor)
