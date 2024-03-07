//
//  ExampleViewBG.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 4.02.2024.
//

import SwiftUI

struct ExampleViewBG: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("BgColorEx1"),Color.black,Color("BgColorEx2")], startPoint:.top, endPoint: .bottom).ignoresSafeArea(.all,edges: .all)
        }
    }
}

#Preview {
    ExampleViewBG()
}
