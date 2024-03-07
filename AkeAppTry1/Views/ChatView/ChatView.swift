//
//  ChatViewPractice.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 19.02.2024.
//

import SwiftUI




struct ChatView: View {
    
    // MARK: -PROPERTIES
    @EnvironmentObject var akeLoginViewModel:AkeLoginViewModel
    @Binding var selectedTab: Tab
    @State var text = ""
    @State private var scrollProxy: ScrollViewProxy?
    @FocusState private var nameIsFocused: Bool
    
    
    // MARK: -BODY
    var body: some View {
        VStack(alignment:.leading) {
            
            // MARK: - Back Button
            Button(action: {
                selectedTab = .house
            }, label: {
                HStack {
                    Image(systemName: "arrow.backward")
                    Text("Ana Sayfa")
                }
                .fontWeight(.bold)
                .foregroundStyle(Color.red)

            })
            .padding()
            
            // MARK: -ScrollView
            ScrollViewReader { scrollViewProxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(akeLoginViewModel.messages) { message in
                            MessagesView(message: message)
                                .id(message.id) // Her mesaj için benzersiz bir id belirliyoruz
                        }
                    }
                    .onChange(of: akeLoginViewModel.messages) { _ in
                        // Mesajlar değiştiğinde, en son mesajın olduğu yere kaydır
                        withAnimation {
                            scrollViewProxy.scrollTo(akeLoginViewModel.messages.last?.id, anchor: .bottom)
                        }
                    }
                } //:ScrollView
                .onAppear {
                    // Sayfa açıldığında, en son mesajın olduğu yere kaydır
                    self.scrollProxy = scrollViewProxy
                    DispatchQueue.main.async {
                        scrollViewProxy.scrollTo(akeLoginViewModel.messages.last?.id, anchor: .bottom)
                    } //:DispatchQueue
                }//:Onappear
            } //:ScrollViewReader
            .zIndex(0)
            
            //MARK: - TEXTFIELD
            ZStack(alignment: .trailing, content: {
                HStack {
                    Image(systemName: nameIsFocused ? "xmark":"")
                        .onTapGesture {
                            nameIsFocused.toggle()
                        }
                    
                    TextField("Hello There", text: $text, axis: .vertical)
                        .padding(12)
                        .padding(.trailing,48)
                        .background(Color(uiColor: .systemGray5))
                        .clipShape(Capsule())
                        .font(.subheadline)
                        .autocorrectionDisabled()
                    .focused($nameIsFocused)
                }
                Button(action: {
                    if !text.isEmpty {
                        akeLoginViewModel.sendMessage(text: text) { success in
                            if success {
                                
                            } else {
                                print("errorr")
                            }
                        }
                        text = ""
                    }
                }, label: {
                    Text("Send")
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
                .disabled(text.isEmpty)
            })
            .padding()
            .zIndex(0)
        }
    }
}


#Preview {
    ChatView(selectedTab: .constant(.messages))
        .environmentObject(AkeLoginViewModel())
}
