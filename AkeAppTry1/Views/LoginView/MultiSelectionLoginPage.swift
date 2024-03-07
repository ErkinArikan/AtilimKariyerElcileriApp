//
//  LoginPage.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 16.02.2024.
//

import SwiftUI
import RiveRuntime



struct MultiSelectionLoginPage: View {
    // MARK: - PROPERTIES
    
    @State private var presentNextView = false
    
    @State private var showAkeLogin:Bool = false
    @State private var showMainView:Bool = false
    @State private var isWelcome:Bool = false
 
    
    // MARK: - BODY
    var body: some View {
        NavigationStack{
            ZStack {
                
                //BG
                multiSelectionPageBG
                RiveViewModel(fileName: "myAnimation3").view()
                .ignoresSafeArea(.all,edges: .all)
                .blur(radius: 30)
           
                
                VStack(spacing:0){
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        
                        

                    Spacer()
//                    Text("HOŞGELDİN")
//                        .font(.system(size: 35,weight: .bold))
//                        .multilineTextAlignment(.center)
//                        .foregroundStyle(Color.MyCardTextColor)
//                        .scaleEffect(isWelcome ? 1:0.97)
//                        .animation(.easeOut(duration: 1).repeatForever(), value: isWelcome)
                    
                    
                    
                    VStack(spacing:40) {
                        
                        //Ake Giriş Butonu
                        akeLoginButton
                        
                        //Guest Giriş Butonu
                        
                        guestLoginButton
                        
                        
                    }//:HStack
                    
                    Spacer()
                    
                } //:VStack

            } //:ZStack
            
        } //:NavStac
        .onAppear(){
            isWelcome.toggle()
        }
    }
}
// MARK: -PREVIEW
#Preview {
    MultiSelectionLoginPage()
}



// extension kullandığında yerel değişkenleri de kullanabiliyorsun.

extension MultiSelectionLoginPage{
    
    // MARK: - AKE LOGIN BUTTON
    private var akeLoginButton:some View{
        Button {

            showAkeLogin.toggle()
            
            
        } label: {
            HStack {
                Image(systemName:  "graduationcap.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
                    .foregroundStyle(Color.MyCardTextColor)
                
                Text("Kariyer Elçisi")
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundStyle(Color.MyCardTextColor)
            }
        }
        
        .frame(width: 250,height: 60)
        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color("FullMyBlueColor"), lineWidth: 4))
        .cornerRadius(30)
        .fullScreenCover(isPresented: $showAkeLogin, content: {
            LoginPageView()
        })
        
 
    }
    
    // MARK: - GUEST LOGIN BUTTON
    private var guestLoginButton: some View {
        Button {

            showMainView.toggle()
        } label: {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.MyCardTextColor2) // Burada "foregroundStyle" yerine "foregroundColor" kullanmalısınız.
                Text("Misafir")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.MyCardTextColor2) // Burada da "foregroundStyle" yerine "foregroundColor" kullanmalısınız.
                
            }
            
        }
        .frame(width: 250, height: 60)
        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.MyCardTextColor2, lineWidth: 4))
        .cornerRadius(30)
        .fullScreenCover(isPresented: $showMainView, content: {
            MainView()
        })
    }
    
    // MARK: - BACKGROUND COLOR
    private var multiSelectionPageBG:some View{
        Color.MyBackgroundColor2.ignoresSafeArea(.all,edges: .all)
    }

}
