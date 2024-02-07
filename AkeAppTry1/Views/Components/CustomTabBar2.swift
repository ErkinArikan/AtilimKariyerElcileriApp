//
//  CustomTabBar2.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 7.02.2024.
//

import SwiftUI

struct CustomTabBar2: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .people
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems){ item in
                    Button(action: {
                        
                        withAnimation {
                            selectedTab = item.tab
                        }
                    }, label: {
                        Image(systemName:selectedTab == item.tab ? item.iconFill:item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30,height: 40)
                            .padding(.horizontal,20)
                            .opacity(selectedTab == item.tab ? 1:0.5)
                            .scaleEffect(selectedTab == item.tab ? 1.25: 1.0)
                            .background {
                                VStack{
                                   Circle()
                                        .frame(width:20,height:4)
                                        .offset(y: -5)
                                        .opacity(selectedTab == item.tab ? 1:0)
                                        .scaleEffect(selectedTab == item.tab ? 1.25: 1.0)
                                        Spacer()
                                }
                            }
                           
                            
                            
                    })
                }
            } //:HStack
            .padding(12)
            .background(Color(UIColor.systemGray4).opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color(UIColor.systemGray4).opacity(0.3), radius: 20,x:0,y:20)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            })
        .padding(.horizontal,24)
        }
    }
}

#Preview {
    CustomTabBar2()
}


struct TabItems:Identifiable{
    var id = UUID()
    var icon:String
    var iconFill:String
    var tab:Tab
    
}

var tabItems:[TabItems] = [
    TabItems(icon: "house", iconFill: "house.fill", tab: .house),
    TabItems(icon: "message", iconFill: "message.fill", tab: .messages),
    TabItems(icon: "person", iconFill: "person.fill", tab: .people),
    TabItems(icon: "gearshape", iconFill: "gearshape.fill", tab: .gear)
]


enum Tab:String{
    case house
    case messages
    case people
    case gear
}

