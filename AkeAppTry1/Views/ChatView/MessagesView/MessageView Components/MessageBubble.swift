//
//  MessageBubble.swift
//  AkeAppTry1
//
//  Created by BLG-BC-003 on 22.02.2024.
//

import SwiftUI

struct MessageBubble: Shape {
    let isFromCurrentUser:Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,isFromCurrentUser ? .bottomLeft:.bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

#Preview {
    MessageBubble(isFromCurrentUser: true)
}
