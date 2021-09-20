//
//  ContextModifier.swift
//  SwiftUI_CompositionalLayout
//
//  Created by park kyung seok on 2021/09/20.
//

import SwiftUI

struct ContextModifier: ViewModifier {
   
    // ContextMenu Modifier
    var card: Card
    
    func body(content: Content) -> some View {
        
        content
            .contextMenu(ContextMenu(menuItems: {
                Text("By \(card.author)")
            }))
            .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}
