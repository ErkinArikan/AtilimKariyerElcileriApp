//
//  CustomTabBar2.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 7.02.2024.
//

import SwiftUI

struct MyTabView: View {
    @Binding var isAkeLogged:Bool
    
    @AppStorage("selectedTab") var selectedTab:Tab = .house
    var body: some View {
        VStack {
            Spacer()
            if isAkeLogged{
                myTabview
            }else{
                myTabView2
            }
           
           
        } //:VStack
    }
}

#Preview {
    MyTabView(isAkeLogged: .constant(true))
}

extension MyTabView{
    private var myTabview:some View{
        
        
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
                        .frame(width: 25,height: 25)
                        .padding(.horizontal)
                        .opacity(selectedTab == item.tab ? 1:0.5)
                        .scaleEffect(selectedTab == item.tab ? 1.25: 1.0)
                        .foregroundStyle(Color("FullMyBlueColor"))
                })
            } //:For
           
        } //:HStack
        .padding(12)
        .background(Color.MyGrayColor.opacity(0.8))
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.MyGrayColor.opacity(0.3), radius: 20,x:0,y:20)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
        })
        .offset(y:10)
        
    }
    
    private var myTabView2:some View{
        HStack {
            ForEach(tabItems2){ item in
                Button(action: {
                    
                    withAnimation {
                        selectedTab = item.tab
                    }
                }, label: {
                    Image(systemName:selectedTab == item.tab ? item.iconFill:item.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height:25)
                        .padding(.horizontal,20)
                        .opacity(selectedTab == item.tab ? 1:0.5)
                        .scaleEffect(selectedTab == item.tab ? 1.25: 1.0)
                })
            } //:For
           
        } //:HStack
        .padding(12)
        .background(Color.MyGrayColor.opacity(0.8))
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.MyGrayColor.opacity(0.3), radius: 20,x:0,y:20)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
        })
    .padding(.horizontal,24)
    .offset(y:10)
    }
    
    
}


struct TabItems:Identifiable{
    var id = UUID()
    var icon:String
    var iconFill:String
    var tab:Tab
    
}

var tabItems:[TabItems] = [
    TabItems(icon: "person.3", iconFill: "person.3.fill", tab: .people),
    TabItems(icon: "house", iconFill: "house.fill", tab: .house),
    TabItems(icon: "calendar", iconFill: "calendar.badge.clock", tab: .calendar),
    TabItems(icon: "message", iconFill: "message.fill", tab: .messages),
   
    
]

var tabItems2:[TabItems] = [
    TabItems(icon: "person.3", iconFill: "person.3.fill", tab: .people),
    TabItems(icon: "house", iconFill: "house.fill", tab: .house),
//    TabItems(icon: "message", iconFill: "message.fill", tab: .messages),
   
    
]




enum Tab:String{
    case people
    case house
    case messages
    case calendar
    
}

enum Tab2:String{
    case people
    case house
}

