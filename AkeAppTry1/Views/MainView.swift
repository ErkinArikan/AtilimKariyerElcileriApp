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
    
    // MARK: -PROPERTIES
    @AppStorage("selectedTab") var selectedTab:Tab = .people
    @State var isAnimating:Bool = false
    
    @State var isShowing:Bool = false
    
    // MARK: -BODY
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("MywhiteColor")], startPoint:.top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all)
                
                
                
                
                VStack{
                    HStack {
                        // MARK: - left button
                        LeftIcon
                        
                        Spacer()
                        
                        CenterIcon
                        
                        
                        Spacer()
                        
                        RightIcon
                        
                        
                    } //:Hstack
                    .padding(.horizontal)
                    Spacer()
                    switch selectedTab {
                    case .house:
                        HomeView()
                    case .messages:
                        Text("Message view")
                    case .people:
                        PersonsView()
                    case .gear:
                        ActivitiyView()
                    } //:switch
                    
                    
                }
                
                CustomTabBar2(selectedTab: selectedTab)
                GeometryReader{ _ in
                    PersonViewSideMenu(isShowing: $isShowing)
                        .offset(x: self.isShowing ? 0 : -UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.5), value: self.isShowing)
                }

                .background(Color.black.opacity(isShowing ? 0.5:0))
                
            } //:ZSTack
            .onAppear(perform: {
                isAnimating.toggle()
            })
            
        }//:NavStack
        
        
        
    }
        
        

        
        
    }


// MARK: -PREVIEW
#Preview {
    MainView()
}



extension MainView{
    
    private var LeftIcon: some View{
        Button(action: {
            isShowing.toggle()
        }, label: {
           Image(systemName: "text.justify")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .offset(x:isAnimating ? 0:-30)

                .scaleEffect(isAnimating ? 1:0.8)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
        }) // Left Button
        
    }
    
    private var CenterIcon: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 95)
            .offset(y:isAnimating ? 0:-25)
            .opacity(isAnimating ? 1:0)
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            .shadow(color:.white,radius: 10)
        
    }
    
    private var RightIcon: some View{
        Button(action: {
            
        }, label: {
            Image(systemName: "gearshape.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .offset(x:isAnimating ? 0:50)
                .scaleEffect(isAnimating ? 1:0.8)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
        })
    }
}
