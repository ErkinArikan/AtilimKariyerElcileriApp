//
//  ContentView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import SwiftUI
import SwiftUISideMenu

struct MainView: View {
    
    #warning("Herkese farklı renkler verdirmek için random renk dağıt herkese. Bunu PersonModel classında değiştir ve bunu direkt Firebaseye elle eklemen gerekicek sanırsam bunu cod ile de yapabilir miyiz deneyelim bir.")
    
    #warning("onboarding view yapabiliriz bir de")
    #warning(" 1- Neden bu appi yaptığımızı bir şekilde anlatmalıyız ( bir soru işareti ekleyere) bir açılır pencere ile şefaf olabilir yandan geir ")
    
    #warning("5- bi landing pagelere bak kendin tasarla launch screeni de")
    #warning("Kariyer elçilerinin numaraları kendi aramızda gözüksün, misafire gözükmesin")
   
   
    
   
    
    
    
    // MARK: -PROPERTIES
    
    @AppStorage("selectedTab") var selectedTab:Tab = .house
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @EnvironmentObject var personViewModel:MockPersonViewModel
    @EnvironmentObject var practiceViewModel: PersonViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var isAnimating:Bool = false
    
    @State var isShowing:Bool = false
    
    @State private var isLoggedIn: Bool = false
    
    var flag:Bool  = true
    
   
    
    // MARK: -BODY
    var body: some View {
        let isDarkMode = colorScheme == .dark
        NavigationStack {
            ZStack {
                // MARK: - BACKGROUND
                LinearGradient(colors: [Color("MywhiteColor")], startPoint:.top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all)
                
                
                
                
                VStack{
                    // MARK: - NAVBAR
                    HStack {
                       
                        LeftIcon
                        
                        Spacer()
                        
                        CenterIcon
                            .shadow(color:isDarkMode ? Color("myGrayColor"):Color(uiColor: .systemGray5),radius:isDarkMode ? 0:1)
                        
                        
                        Spacer()
                        
                        RightIcon
                        
                        
                    } //:Hstack
                    .padding(.horizontal)
                    Spacer()
                    
                    
                    switch selectedTab {
                    case .house:
                        HomeView()
                    case .messages:
                        ChatView(selectedTab: $selectedTab)
                    case .people:
                        PersonsView()
                    case .calendar:
                        CalenderView()
                    }
                    
                } //:VStack
                
                
                // MARK: - TABVIEW
                if selectedTab == .house || selectedTab == .people||selectedTab == .calendar{
                    MyTabView(isAkeLogged: $akeLoginViewModel.isAkeLoggedIn, selectedTab: selectedTab)
                        .foregroundStyle(Color("FullMyBlueColor"))
                        .ignoresSafeArea(.keyboard)
                       
                }else {
                    
                }
                
                
                
                // MARK: - SIDE MENU
                GeometryReader{ _ in
                    SideMenuView(isShowing: $isShowing)
                        .offset(x: self.isShowing ? 0 : -UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.5), value: self.isShowing)
                }
                

                .background(Color.black.opacity(isShowing ? 0.5:0))
                
            } //:ZSTack
            
            .onAppear(perform: {
                isAnimating.toggle()
            })
            
        }//:NavStack

        
        
        
    } //:Body
        
        
        
    }


// MARK: -PREVIEW
#Preview {
    MainView()
        .environmentObject(AkeLoginViewModel())
        .environmentObject(MockPersonViewModel())
        .environmentObject(PersonViewModel())
}


// MARK: - EXTENSIONS
extension MainView{
    
    // MARK: - LEFT ICON NAVBAR
    private var LeftIcon: some View{
        Button(action: {
            withAnimation {
               isShowing.toggle()
            }
        }, label: {
           Image(systemName: "text.justify")
               
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .offset(x:isAnimating ? 0:-30)

                .scaleEffect(isAnimating ? 1:0.8)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
                .foregroundStyle(Color.MyCardTextColor)
        }) // Left Button
        
    }
    // MARK: - CENTER ICON NAVBAR
    private var CenterIcon: some View {
    
        return Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 85)
            .offset(y:isAnimating ? 0:-25)
            .opacity(isAnimating ? 1:0)
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            
        
    }
   // MARK: - RIGHT ICON
    private var RightIcon: some View{
        Button(action: {
            
        }, label: {
            Image(systemName: "")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .offset(x:isAnimating ? 0:50)
                .scaleEffect(isAnimating ? 1:0.8)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
        })
    }
     
}

