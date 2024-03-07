////
////  RowViewPractice.swift
////  AkeAppTry1
////
////  Created by BLG-BC-003 on 15.02.2024.
////
//
//import SwiftUI
//
//struct RowViewPractice: View {
//    // MARK: -PROPERTIES
//    @ObservedObject var vm = PracticeViewModel()
//    
//    @State var isAnimating:Bool = false
//    @State var isFlipped:Bool = false
//    @State var isBacCardAnimating:Bool = false
//    @State var degrees:Double = 0
//    
//    // MARK: -BODY
//    var body: some View {
//        
//        ScrollView(showsIndicators: false) {
//            VStack {
//                
//                
//                
//                
//                if vm.dataFetched {
//                    FrontCardView(person: vm.filteredPersonArr[0], isAnimating: $isAnimating, isFlipped: $isFlipped, isBacCardAnimating: $isBacCardAnimating)
//                } else {
//                    ProgressView()
//                }
//            }
//            .onAppear() {
//                
//                withAnimation {
//                    isAnimating = true
//                }
//            }
//        }
//        
//        
//        
//    }//:body
//    
//    
//}
//
//
//// MARK: -PREVIEW
//#Preview {
//    RowViewPractice()
//}
//
//
//struct  CardView: View {
//    let person: AkeModel
//    @Binding var isAnimating: Bool
//    @Binding var isFlipped:Bool
//    @Binding var isBacCardAnimating:Bool
//    @State var degrees:Double = 0
//    
//    var body: some View {
//        VStack {
//            if !isFlipped{
//                Image("CardBackground")
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(20)
//                    .frame(width: 300)
//                
//                // MARK: - PHOTO OVERLAY
//                    .overlay(alignment: .bottomTrailing) {
//                        if let imageURL = person.imageURL {
//                            AsyncImage(url: URL(string: "https://photos.google.com/search/_tra_/photo/AF1QipO6BkQg6lIClXVeU1O68u9_35sPKYtqWmv_ehZx")) { phase in
//                               
//                                    phase
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 270)
//                                        .offset(x: isAnimating ? 0 : 20)
//                                
//                            } placeholder: {
//                                ProgressView()
//                            }
//                        } else {
//                            // Eğer imageURL nil ise, yani resim yoksa buraya bir alternatif görüntü ekleyebilirsiniz.
//                            Text("Resim yok")
//                        }
//                                    }
//                    .animation(.easeOut(duration: 0.9), value: isAnimating)
//                    .shadow(color: Color.black, radius: 7, x: 0.0, y: 10)
//                    
//                    // MARK: - İSİM OVERLAY
//                    .overlay(alignment: .topLeading) {
//                        Text(person.name)
//                            .font(.system(size: 25))
//                            .foregroundColor(Color("CardTextColor"))
//                            .fontWeight(.bold)
//                            .offset(x: 30, y: 60)
//                            .opacity(isAnimating ? 0.8 : 0)
//                    }
//            } // if
//            
//        /*    // MARK: -ELSE
//            else{
//    
//                Image("FlippedCard2")
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(20)
//                    .frame(width: 300)
//                    .shadow(color: Color.black, radius: 7, x: 0.0, y: 10)
//                    .overlay{
//                        RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundStyle(Color.MyCardTextColor)
//                    } //:overlay 1
//                
//                
//                
//                
//                    .overlay(alignment: .bottom) {
//                        
//                        Button(action: {
//                            
//                        }, label: {
//                            Image("linkedin")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 50)
//                                .shadow(radius: 10)
//                                .scaleEffect(x: -1, y: 1)
//                                .onTapGesture {
//                                    // link will be here
//                                }
//                        })
//                        .offset(y:isBacCardAnimating ? -20:20)
//                        .animation(.spring(duration:1), value: isBacCardAnimating)
//                        
//                    } //: overlay 2
//                
//                
//                
//                    .overlay(alignment: .top) {
//                        Image(person.backwardImage)
//                            .resizable()
//                            .scaledToFit()
//                            .background(Color.MyWhiteColor.clipShape(Circle()).shadow(color:.black,radius: 5))
//                            .frame(width: 80)
//                            .scaleEffect(x: -1)
//                            .offset(y:isBacCardAnimating ?  15:-20)
//                            .animation(.spring(duration:1), value: isBacCardAnimating)
//                    } //overlay 3
//                
//                
//                
//                    .overlay(alignment: .center) {
//                        VStack{
//                            Text(person.fullName)
//                                .font(.title)
//                                .fontWeight(.bold)
//                            Text("")
//                            Text(person.akeTitle)
//                                .font(.subheadline)
//                            Text("")
//                            Text("\(person.major)" + "\(person.doubleMajor ?? "")")
//                                .font(.caption)
//                                .multilineTextAlignment(.center)
//                            
//                        }
//                        .scaleEffect(x: -1, y: 1)
//                        .foregroundStyle(Color.MyWhiteColor)
//                        .padding(.horizontal)
//                        .scaleEffect(isBacCardAnimating ? 1:0.2)
//                        .animation(.spring(duration:1), value: isBacCardAnimating)
//                    } //overlay 4
//                
//            
//            }//:Else
//           */
//            
//        }//:VStack
//        .rotation3DEffect(
//            .degrees(degrees),
//            axis: (x: 0.0, y: -1.0, z: 0.0)
//        )
//        .onTapGesture {
//            withAnimation {
//                degrees += 180
//                isFlipped.toggle()
//                
//                
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
//                isBacCardAnimating.toggle()
//            }
//            
//        }
//        .onAppear(){
//            
//            withAnimation {
//                isAnimating = true
//                
//            }
//            
//        }
//        
//    }
//}
