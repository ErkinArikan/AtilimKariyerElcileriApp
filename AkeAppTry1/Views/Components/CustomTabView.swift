////
////  CustomTabView.swift
////  AkeAppTry1
////
////  Created by BLG-BC-003 on 4.02.2024.
////
//
//import SwiftUI
//
//
////genelde enum kullanılıyor tabViewlarda
//enum Tab: String,CaseIterable{
//    case house
//    case message
//    case person
//    case leaf
//    case gearshape
//}
//
//
//struct CustomTabView: View {
//    // sanırsam binding olmasının sebebi tıklama yapıp bir değişiklik olması için aynı instagram appinde de yaptığımız gibi.
//   
//    @Binding var selectedTab:Tab // tab tipinde bir değişken yarattık.
//    
//    //Computed property yaptı.
//    private var fillImage:String{
//        selectedTab.rawValue + ".fill"   // rawValue enumda olan bir özellik . Biz string yaptığımız için her biri string oldu ve tıkladığımızı doldurma için fill ekledik.
//    }
//    
//    //Computed property içinde her bir iconun rengini dinamik olarak belirledik.
//    private var tabColor:Color{
//        switch selectedTab {
//        case .house:
//            return .blue
//        case .message:
//            return .green
//        case .person:
//            return .indigo
//        case .leaf:
//            return .green
//        case .gearshape:
//            return .orange
//        }
//    }
//    
//    
//    var body: some View {
//        VStack{
//            HStack{
//                ForEach(Tab.allCases, id:\.rawValue){ tab in
//                    Spacer()
//                    // eğer tıklama yaparsam içini doldur yoksa doldurulmamış fotoyu koy
//                    Image(systemName: selectedTab == tab ? fillImage:  tab.rawValue)
//                        .scaleEffect(selectedTab == tab ? 1.25: 1.0)
//                        .foregroundStyle(selectedTab == tab ? tabColor : Color.gray)
//                        .font(.system(size: 22))
//                        .onTapGesture {
//                            withAnimation(.easeIn(duration: 0.1)) {
//                                selectedTab = tab//house , message ...
//                            }
//                        }
//                    Spacer()
//                }
//            }
//            .frame(width: nil,height: 60)
//            .padding(.horizontal)
//        }
//    }
//}
//
//#Preview {
//    CustomTabView(selectedTab: .constant(.house))
//}
