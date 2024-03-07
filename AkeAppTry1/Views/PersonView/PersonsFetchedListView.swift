//
//  FetchDeneme.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 13.02.2024.
//
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

#warning("Burada fetch ettiğinde animasyonlar yetişemiyor o yüzden bir tane model view içersinde yapabilirsin")

#warning("Fotoğrafları cachelemen lazım böyle her defasında indirmek olmaz hocam")

#warning("insanları arama yaparken ilk harflerini kontrol ettirtmen lazım")






// MARK: - VIEW
struct PersonsFetchedListView: View {
    
    
    // MARK: -PROPERTIES
    @EnvironmentObject var practiceViewModel:PersonViewModel
    @State var isAnimating:Bool = false
    @State var isFlipped:Bool = false
    @State var isBacCardAnimating:Bool = false
    @State var degrees:Double = 0
    
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                if practiceViewModel.dataFetched {
                    ForEach(practiceViewModel.filteredPersonArr) { person in
                        AkeCardView(person: person, isBacCardAnimating: $isBacCardAnimating)
                            .transition(.opacity)
                            .padding()
                    } //:For
                } else {
                    ProgressView()
                } //:Else
            } //:VStack
            .onAppear() {
                
                withAnimation {
                    isAnimating = true
                }
            } //:onAppear
        }//:SCROLL
    } //:BODY
}

// MARK: - PREVIEW
#Preview {
    PersonsFetchedListView()
        .environmentObject(PersonViewModel())
}



struct AkeCardView: View {
    
    
    let person: AkePersonModel
    @State var isAnimating: Bool = false
    @State var isFlipped:Bool = false
    @Binding var isBacCardAnimating:Bool
    @State var degrees:Double = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        VStack {
            if !isFlipped{
                Image(isDarkMode ? "CardBackgroundDark":"CardBackground")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 270)
                    .shadow(color: Color.black.opacity(1), radius:4, x:0, y: 5)
                    .overlay(alignment: .bottomTrailing) {
                        if let photoURL = person.fetctPhotoURL(){
                            WebImage(url: photoURL)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .shadow(color: Color.black.opacity(10), radius: 10, x: 0, y: 5)
                            
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 28,height: 28)
                                .foregroundStyle(Color(uiColor: .systemGray4))
                            // Eğer imageURL nil ise, yani resim yoksa buraya bir alternatif görüntü ekleyebilirsiniz.
                            Text("Resim yok")
                        }
                    } // overlay1
                    
                    
                    .overlay(alignment: .topLeading) {
                        Text(person.name)
                            .font(.system(size: 25))
                            .foregroundColor(Color("CardTextColor"))
                            .fontWeight(.bold)
                            .offset(x: 30, y: 60)
                            .opacity(isAnimating ? 0.8 : 0)
                            .animation(.spring(duration: 1), value: isAnimating)
                    }

            } // if
            else{
                
                Image(isDarkMode ? "FlippedCard3":"FlippedCard2")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 270)
                    .shadow(color: Color.black.opacity(1), radius:4, x:0, y: 5)
                    .overlay(alignment: .bottom) {
                        Button(action: {
                            if let linkedinURL = URL(string: person.linkedinURL ?? "https://wikipedia.org") {
                                UIApplication.shared.open(linkedinURL)
                            }
                        }) {
                            Image("linkedin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(radius: 10)
                                .scaleEffect(x: -1, y: 1)
                        }
                        .offset(y: isBacCardAnimating ? -20 : 20)
                        .animation(.spring(duration: 1), value: isBacCardAnimating)
                    }
                
                
                
                    .overlay(alignment: .top) {
                        if let photoURL = person.fetctBackPhotoURL(){
                            WebImage(url: photoURL)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .clipShape(Circle())
                                .background(Color.MyBackgroundColor2.clipShape(Circle()).shadow(color:.black,radius: 5).frame(width: 70))
                                
                                .scaleEffect(x: -1)
                                .offset(y:isBacCardAnimating ?  2:-20)
                                .animation(.spring(duration:1), value: isBacCardAnimating)
                        }
                       
                            
                    } //overlay 3
                
                
                
                    .overlay(alignment: .center) {
                        VStack{
                            Text(person.fullName)
                                .font(.system(size: 20))
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
                        .foregroundStyle(Color.MyBackgroundColor2)
                        .padding(.horizontal)
                        .scaleEffect(isBacCardAnimating ? 1:0.2)
                        .animation(.spring(duration:1), value: isBacCardAnimating)
                    } //overlay 4
                
                
            }//:Else
            
            
        }//:VStack
        .rotation3DEffect(
            .degrees(degrees),
            axis: (x: 0.0, y: -1.0, z: 0.0)
        )
        .onTapGesture {
            withAnimation {
                degrees += 180
                isFlipped.toggle()
                
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                isBacCardAnimating = true
            }
            
        }
        .onAppear(){
            
            withAnimation {
                isAnimating = true
                
            }
            
        }
        
    }
}





