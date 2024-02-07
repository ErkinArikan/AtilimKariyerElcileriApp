//
//  PersonListRowView.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 2.02.2024.
//

import SwiftUI

struct PersonListRowView: View {
    @State var isAnimating:Bool = false
    @State var isFlipped:Bool = false
    @State var isBacCardAnimating:Bool = false
    @State var degrees:Double = 0
   
    
    var person:PersonModel
    
    var body: some View {
        
        // MARK: -FRONT
        VStack{
            if !isFlipped{
                
                Image("CardBackground")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 270)
                    .overlay(alignment: .bottomTrailing) {
                        Image(person.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 240)
                            .offset(x: isAnimating ? 0:20)
                            .animation(.easeOut(duration: 0.9), value: isAnimating)
                            
                    }
                    .shadow(color: Color.black, radius: 7, x: 0.0, y: 10)
                    .overlay(alignment: .topLeading) {
                        Text(person.name.uppercased())
                            .font(.system(size: 20))
                            .foregroundStyle(Color("CardTextColor"))
                            .fontWeight(.bold)
                            .offset(x:30,y:60)
                            .opacity(isAnimating ? 0.8:0)
                            .animation(.spring(duration: 1), value: isAnimating)
                            
                            
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundStyle(Color.MyCardTextColor)
                    }
                    
            }else {
                
                // MARK: - BACK
                Image("FlippedCard2")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 300)
                    .shadow(color: Color.black, radius: 7, x: 0.0, y: 10)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundStyle(Color.MyCardTextColor)
                    } //:overlay 1
                
                
                
                
                    .overlay(alignment: .bottom) {
                       
                        Button(action: {
                            
                        }, label: {
                            Image("linkedin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(radius: 10)
                                .scaleEffect(x: -1, y: 1)
                                .onTapGesture {
                                    // link will be here
                                }
                        })
                        .offset(y:isBacCardAnimating ? -20:20)
                        .animation(.spring(duration:1), value: isBacCardAnimating)
      
                    } //: overlay 2
                
                
                
                    .overlay(alignment: .top) {
                        Image(person.backwardImage)
                             .resizable()
                             .scaledToFit()
                             .background(Color.MyWhiteColor.clipShape(Circle()).shadow(color:.black,radius: 5))
                             .frame(width: 80)
                             .scaleEffect(x: -1)
                             .offset(y:isBacCardAnimating ?  15:-20)
                             .animation(.spring(duration:1), value: isBacCardAnimating)
                    } //overlay 3
                
                
                
                    .overlay(alignment: .center) {
                        VStack{
                            Text(person.fullName)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("")
                            Text(person.akeTitle)
                                .font(.subheadline)
                            Text("")
                            Text("\(person.major)" + "\(person.doubleMajor ?? "")")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                            
                        }
                        .scaleEffect(x: -1, y: 1)
                        .foregroundStyle(Color.MyWhiteColor)
                        .padding(.horizontal)
                        .scaleEffect(isBacCardAnimating ? 1:0.2)
                        .animation(.spring(duration:1), value: isBacCardAnimating)
                    } //overlay 4
                    
            } //:Else
            
           
        } //:VStack
        .rotation3DEffect(
            .degrees(degrees),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .onTapGesture {
            withAnimation {
                degrees += 180
                isFlipped.toggle()
                
                
                }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                isBacCardAnimating.toggle()
            }
            
        }
        .onAppear(){
            
            withAnimation {
                isAnimating = true
                
            }
            
        }
       
        
        
        
    }
}

#Preview {
    ZStack(content: {
        LinearGradient(colors: [Color(UIColor.systemBlue)], startPoint:.bottomTrailing, endPoint: .topLeading).ignoresSafeArea(.all,edges: .all)
        PersonListRowView(person: examplePersonObj)
    })
    
}

