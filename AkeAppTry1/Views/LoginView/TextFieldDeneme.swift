//
//  TextFieldDeneme.swift
//  AkeAppTry1
//
//  Created by Erkin Arikan on 4.03.2024.
//

import SwiftUI

struct TextFieldDeneme: View {
    @State var text:String = ""
    @State var isTapped:Bool = false
    var body: some View {
        VStack{
            
            VStack(alignment:.leading, spacing: 4) {
                HStack(spacing:15){
                    TextField("", text: $text) { (status) in
                        // it will fire when text field is clicked...
                        if status{
                            withAnimation(.easeIn){
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        //it will fire when return button pressed...
                        //only if no text typed..
                        if text == ""{
                            withAnimation(.easeOut){
                                isTapped = false
                            }
                        }
                        
                    
                    }
                    
                    //Sağ taraftaki kişi simgesi
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "person.2")
                            .foregroundStyle(isTapped ? .blue : .gray)
                    })
                }
                //TextField ve buttonun editi.
                
                //if tatpped...
                .padding(.top,isTapped ? 15:0)
                
                //overlay  will avoid clicking the textfield..
                //so moving it below the textField...
                .background(alignment:.leading) {
                    Text("UserName")
                        .scaleEffect(isTapped ? 0.8: 1)
                        .offset(x: isTapped ? -7:0 ,y: isTapped ? -15 : 0)
                        .foregroundStyle(isTapped ? .blue : .gray)
                }
                .padding(.horizontal)
                
                //Divider Color...
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1: 0.5)
                    .frame(height: 1)
                    .padding(.top,10)

                    
            }//En üst VStack bitiş.
            .padding(.top,12)
            .background(Color.gray.opacity(0.09))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            

        }
        .padding()
        
    }
}

#Preview {
    TextFieldDeneme()
}
