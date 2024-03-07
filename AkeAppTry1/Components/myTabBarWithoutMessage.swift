//
//  myTabBarWithoutMessage.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 17.02.2024.
//

//import SwiftUI
//
//struct myTabBarWithoutMessage: View {
//    var selectedTab2:Tab2 = .house
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            HStack {
//                
//                ForEach(tabItems2){ item in
//                    Button(action: {
//                        
//                        withAnimation {
//                            selectedTab2 = item.tab
//                        }
//                    }, label: {
//                        Image(systemName:selectedTab2 == item.tab ? item.iconFill:item.icon)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30,height: 40)
//                            .padding(.horizontal,20)
//                            .opacity(selectedTab2 == item.tab ? 1:0.5)
//                            .scaleEffect(selectedTab2 == item.tab ? 1.25: 1.0)
//                            .background {
//                                VStack{
//                                   Circle()
//                                        .frame(width:20,height:4)
//                                        .offset(y: -5)
//                                        .opacity(selectedTab2 == item.tab ? 1:0)
//                                        .scaleEffect(selectedTab2 == item.tab ? 1.25: 1.0)
//                                        Spacer()
//                                }
//                            }
//                           
//                            
//                            
//                    })
//                } //:For
//            } //:HStack
//            .padding(12)
//            .background(Color.MyGrayColor.opacity(0.8))
//            .background(.ultraThinMaterial)
//            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
//            .shadow(color: Color.MyGrayColor.opacity(0.3), radius: 20,x:0,y:20)
//            .overlay(content: {
//                RoundedRectangle(cornerRadius: 24, style: .continuous)
//                    .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
//            })
//        .padding(.horizontal,24)
//        }
//    }
//}
//
//#Preview {
//    myTabBarWithoutMessage()
//}
//
//var tabItems2:[TabItems] = [
//    TabItems(icon: "person", iconFill: "person.fill", tab: .people),
//    TabItems(icon: "house", iconFill: "house.fill", tab: .house),
//    
//   
//    TabItems(icon: "gearshape", iconFill: "gearshape.fill", tab: .gear)
//]
