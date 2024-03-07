//
//  DenemeTabView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 22.02.2024.
//

import SwiftUI

struct DenemeTabView: View {
    @State private var selectedTab: TabPractice = .home
        
        var body: some View {
            NavigationView {
                if selectedTab == .home {
                    TabBarView(selectedTab: $selectedTab)
                        .navigationBarHidden(true)
                } else if selectedTab == .message {
                    MessageView(selectedTab: $selectedTab)
                }
            }
        }
    }

#Preview {
    DenemeTabView()
}

enum TabPractice {
    case home, message, person
}

struct TabBarView: View {
    @Binding var selectedTab: TabPractice
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeViewPractice()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(TabPractice.home)
            
            Text("Messages")
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
                .tag(TabPractice.message)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(TabPractice.person)
        }
    }
}

struct HomeViewPractice: View {
    var body: some View {
        Text("Home Screen")
    }
}



struct MessageView: View {
    @Binding var selectedTab: TabPractice
    
    var body: some View {
        VStack {
            Text("Message Screen")
            Button("Back") {
                selectedTab = .home
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
    }
}
