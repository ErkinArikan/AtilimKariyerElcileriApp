//
//  PersonViewSideMenu.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 8.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SideMenuView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @Binding var isShowing:Bool
    
    @State private var isLoginTriggered:Bool = false
    // MARK: - BODY
    var body: some View {
        
        
        
            HStack{
                
                VStack(alignment:.leading){
                    
                   
                    xmark
                    
                    profileImage
                    
                    if let user = akeLoginViewModel.currentUser{
                        VStack{
                            Text("Hoşgeldin \(user.fullName)")
                            
                           

                            
                            Spacer()
                            
                            
                            Button {
                                akeLoginViewModel.signOut()
                            } label: {
                                HStack{
                                    Text("Çıkış Yap")
                                        .fontWeight(.bold)
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                    
                                }
                                .foregroundStyle(Color.MyCardTextColor)
                            }
                        } //:Vstack
                        
                    }else{
                        VStack(alignment:.leading,spacing:15){
                            Text("Hoşgeldin ziyaretçi")
                                .font(.system(size: 18,weight: .medium))
                            
                            Group{
                                //Ana sayfa Butonu
                                Button {
                                    //Ana sayfa
                                } label: {
                                    HStack{
                                        Image(systemName: "house.fill")
                                            .foregroundStyle(Color.MyCardTextColor)
                                        Text("Ana Sayfa")
                                            .foregroundStyle(Color.MyCardTextColor2)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .padding(.top)
                                
                                // Akeler butonu
                                
                                Button {
                                    //Elçiler sayfası
                                } label: {
                                    HStack{
                                        Image(systemName: "person.3.fill")
                                            .foregroundStyle(Color.MyCardTextColor)
                                        Text("Elçiler")
                                            .foregroundStyle(Color.MyCardTextColor2)
                                            .fontWeight(.semibold)
                                    }
                                }
                                
                                
                                //Mesajlar
                                
                                Button {
                                    //Mesajlar sayfası açılır
                                } label: {
                                    HStack{
                                        Image(systemName: "bubble.left.and.bubble.right.fill")
                                            .foregroundStyle(Color.MyCardTextColor)
                                        Text("Mesajlar")
                                            .foregroundStyle(Color.MyCardTextColor2)
                                            .fontWeight(.semibold)
                                    }
                                }
                                
                                
                                Button {
                                    
                                } label: {
                                    HStack{
                                        Image(systemName: "calendar.badge.clock")
                                            .foregroundStyle(Color.MyCardTextColor)
                                        Text("Takvim")
                                            .foregroundStyle(Color.MyCardTextColor2)
                                            .fontWeight(.semibold)
                                    }
                                }

                            } //:Buttonlar groupu
                            .padding(.top)
                            .offset(x:-30)
                            
                            

                            
                            Spacer()
                            
                            Button {
                                isLoginTriggered.toggle()
                            } label: {
                                HStack{
                                    Text("Giriş Yap")
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                }
                                .fontWeight(.bold)
                                .foregroundStyle(Color.MyCardTextColor)
                                
                            }
                            .fullScreenCover(isPresented: $isLoginTriggered, content: {
                                LoginPageView()
                            })
                           
                            

                            
                        }
                        
                    }
                    Spacer()
                    
                    
                    

                } //:VStack
                .frame(width: 200)
                .padding(40)
                .background(Color("MyBackgroundColor2"))
                
                
                
                Spacer()
                
                Button(action: {
                    isShowing.toggle()
                }, label: {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.clear)
                        
                        
                })
                
            }
        
            .offset(x: self.isShowing ? 0 : -UIScreen.main.bounds.width)
            .animation(.easeInOut(duration: 0.5), value: self.isShowing)
            
    
        
        
    } //:body
}


// MARK: - PREVIEW
#Preview {
    SideMenuView(isShowing: .constant(true))
        .environmentObject(AkeLoginViewModel())
}


// MARK: - EXTENSION
extension SideMenuView{
    
    // MARK: - PROFILE IMAGE
    private var profileImage:some View{
        ZStack{
            Circle()
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .shadow(radius: 5)
            if let photoURL = akeLoginViewModel.currentUser?.fetctPhotoURL(){
                WebImage(url: photoURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .clipShape(Circle())
            }
            else{
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,height: 80)
                    
            }
        } //:ZStack
        .padding(.bottom,20)
    }
    
    private var xmark:some View{
        Button(action: {
            isShowing.toggle()
        }, label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 20,height: 20)
                .foregroundStyle(Color.MyCardTextColor)
                .fontWeight(.bold)
                
        })
        .offset(x:-30,y:-30)
    }
    
    
    
}
