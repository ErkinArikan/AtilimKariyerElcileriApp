//
//  AkeLoginPageView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 16.02.2024.
//

import SwiftUI
import RiveRuntime

struct LoginPageView: View {
    // MARK: -PROPERTIES
    
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focusedField:FocusedField?
    //Deneme attributeları
    @State var text:String = ""
    @State var isEmailTapped:Bool = false
    @State var isPasswordTapped:Bool = false
    // MARK: -BODY
    var body: some View {
        NavigationStack {
            ZStack{
                
                //BG color
                akeLoginPageBGColor
                RiveViewModel(fileName: "myAnimation3").view()
                .ignoresSafeArea(.all,edges: .all)
                .blur(radius: 50)
           
                
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .offset(x: 150,y:-35)
                     Spacer()
                    Text("Giriş Yap")
                        .font(.system(size: 30,weight: .bold))
                        .foregroundStyle(Color.MyCardTextColor)
                        .padding(.bottom)
                    
                    Text("Tekrar hoş geldin, özlendin.")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundStyle(Color("MyBlackWhiteColor"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    // MARK: -EMAIL TEXT FIELD
                    
                    emailTextField
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    // MARK: -PASSWORD TEXT FIELD
                    passwordTextField
                        .padding(.horizontal)
                    
                    // MARK: -LOGIN BUTTON
                    loginButton
                        .padding(.horizontal)
                    Spacer()
                    Spacer()
                    
                    
                    if let errorMessage = akeLoginViewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }else{
                        
                    }
                    
                    if akeLoginViewModel.showSuccessAnimation{
                        Text("Başarılı giriş yapıldı")
                            .foregroundStyle(.green)
                    }
                    
                } //:VStack
                
                
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                       toolBarXButton
                            .offset(x:30,y: 15)
                    }
                }
                
            }//:ZStack
            
        } //:NavStack
        
    }
}


// MARK: -PROPERTIES
#Preview {
    LoginPageView()
        .environmentObject(AkeLoginViewModel())
       
}


// MARK: -EXTENIONS

extension LoginPageView{
    
    // MARK: - EMAIL TEXTFIELD
    private var emailTextField:some View{
        VStack{
            HStack{
                TextField("", text: $akeLoginViewModel.email) { status in
                    print("Status:", status)
                    
                    if focusedField == nil {
                        
                        withAnimation(.easeIn) {
                            isEmailTapped.toggle()
                        }
                    }else{
                        withAnimation(.easeIn) {
                            isEmailTapped.toggle()
                        }
                    }
                   
                }
                Image(systemName: "person.2")
                    .foregroundStyle(!akeLoginViewModel.isValidEmail ?.red :focusedField == .email ? Color("FullMyBlueColor"):Color.gray)
            }
            .focused($focusedField,equals: .email)
            .padding(.top, akeLoginViewModel.email.isEmpty && isEmailTapped ? 15 : 0)

            .background(alignment:.leading) {
                
                
                Text(akeLoginViewModel.email.isEmpty ? "Kullanıcı Adı":"")
                    .scaleEffect(isEmailTapped ? 0.8: 1)
                    .offset(x: isEmailTapped ? -7:0 ,y: isEmailTapped ? -15 : 0)
                    .foregroundStyle(!akeLoginViewModel.isValidEmail ?.red :focusedField == .email ? Color("FullMyBlueColor"):Color.gray)
            }
            
            .foregroundStyle(Color("FullMyBlueColor"))
            
            .padding()
            .background(Color("myGrayColor").blur(radius: 30))
            .cornerRadius(30)
            
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(!akeLoginViewModel.isValidEmail ?.red :focusedField == .email ? Color.MyCardTextColor:.white, lineWidth: 3))
            .padding(.horizontal)
            .onChange(of: akeLoginViewModel.email) { newValue in
                akeLoginViewModel.isValidEmail = akeLoginViewModel.validateEmail(newValue)
                
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            
            if !akeLoginViewModel.isValidEmail{
                HStack{
                    Text("E-posta adresiniz geçerli değil")
                        .foregroundStyle(.red)
                        .padding(.leading)
                    Spacer()
                }
            }
        
        }
    }
    // MARK: - PASSWORD TEXTFIELD
    private var passwordTextField:some View{
        VStack{
            HStack{
                SecureField("", text: $akeLoginViewModel.password)
                Image(systemName: "key")
                    .foregroundStyle(focusedField == .password ? Color("FullMyBlueColor"):Color.gray)
                   
            }
            .focused($focusedField,equals: .password)
            .padding(.top, akeLoginViewModel.password.isEmpty && isPasswordTapped ? 15 : 0)

            .background(alignment:.leading) {
                
                
                Text(akeLoginViewModel.password.isEmpty ? "Şifre":"")
                    .scaleEffect(isPasswordTapped ? 0.8: 1)
                    .offset(x: isPasswordTapped ? -7:0 ,y: isPasswordTapped ? -15 : 0)
                    .foregroundStyle(focusedField == .password ? Color("FullMyBlueColor"):Color.gray)
            }
            
                
                .foregroundStyle(Color("FullMyBlueColor"))
                .tint(Color.black)
                
                .padding()
                .background(Color("myGrayColor").blur(radius: 30)) //"myTextFieldColor"
                .cornerRadius(30)
                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(focusedField == .password ? Color.MyCardTextColor:.white, lineWidth: 3))
                .padding(.horizontal)
                .onChange(of: focusedField) { newValue in
                        if newValue == .password {
                            withAnimation {
                                isPasswordTapped.toggle()
                            }
                        }else if newValue == .email{
                            withAnimation {
                                isPasswordTapped = false
                            }
                        }
                    }
                .onChange(of: akeLoginViewModel.password) { newValue in
                    akeLoginViewModel.isValidPassword = akeLoginViewModel.validatePassword(newValue)
                    
                        
                }
                
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            
        }
    }
    // MARK: - LOGIN BUTTON
    
    private var loginButton:some View{
        Button(action: {
            Task{
                try await akeLoginViewModel.signIn(withEmail: akeLoginViewModel.email, withPassword: akeLoginViewModel.password )
            }
           
        }, label: {
            HStack {
                Text("Giriş Yap")
                    .font(.system(size: 20,weight: .semibold))
                .foregroundStyle(.white)
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .foregroundStyle(.white)
                    .padding(.leading)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(akeLoginViewModel.showSuccessAnimation ? .green: Color("FullMyBlueColor"))
            .cornerRadius(40)
            .padding(.horizontal)
            .padding(.top,30)
            .opacity(akeLoginViewModel.canProceed ? 1.0:0.5)
            .disabled(!akeLoginViewModel.canProceed)
        })
        
        
    }
    
    // MARK: - XMARK BUTTON
    private var toolBarXButton:some View {
        Button(action: {
            
            withAnimation(.easeOut(duration: 0.5)) {
                dismiss()
            }
            
        }, label: {
            Image(systemName: "arrow.backward")
                .foregroundStyle(Color.MyCardTextColor)
                .fontWeight(.bold)
        })
        .offset(x:-20)
    }
    
    private var akeLoginPageBGColor:some View{
        Color.MyBackgroundColor2.ignoresSafeArea(.all,edges: .all)
    }
    
}


//Eski tarz TextField
/*VStack{
 TextField("", text: $akeLoginViewModel.email)
     .placeholder(when: akeLoginViewModel.email.isEmpty) { // placeholder özelliğini kullanıyoruz
         Text("Email")
             .foregroundColor(Color("FullMyBlueColor"))
             .font(.body)
     }
     .foregroundStyle(Color("FullMyBlueColor"))
     .focused($focusedField,equals: .email)
     .padding()
     .background(Color("myGrayColor"))
     .cornerRadius(12)
     
     .background(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(!akeLoginViewModel.isValidEmail ?.red :focusedField == .email ? Color.MyCardTextColor:.white, lineWidth: 3))
     .padding(.horizontal)
     .onChange(of: akeLoginViewModel.email) { newValue in
         akeLoginViewModel.isValidEmail = akeLoginViewModel.validateEmail(newValue)
            
     }
     .textInputAutocapitalization(.never)
     .autocorrectionDisabled()
     
 
 if !akeLoginViewModel.isValidEmail{
     HStack{
         Text("E-posta adresiniz geçerli değil")
             .foregroundStyle(.red)
             .padding(.leading)
             Spacer()
     }
 }
}
}*/
