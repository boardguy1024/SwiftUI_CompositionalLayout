//
//  Layout1.swift
//  SwiftUI_CompositionalLayout
//
//  Created by park kyung seok on 2021/09/20.
//

import SwiftUI
import SDWebImageSwiftUI

// 30: padding
var width = UIScreen.main.bounds.width - 30

struct Layout1: View {
    
    var cards: [Card]
    
    var body: some View {
        
        HStack(spacing: 4) {
            
            AnimatedImage(url: URL(string: cards[0].download_url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width - ((width / 3) - 4), height: 250) // width: 3/2 scale
                .cornerRadius(4)
                .modifier(ContextModifier(card: cards[0]))
            
            VStack(spacing: 4) {
            
                // 123+123+4 = 250
                // 最後の列のlistが３になるとは限らないため
                
                if cards.count >= 2 {
                    AnimatedImage(url: URL(string: cards[1].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width / 3, height: 123) // width: 3/1 scale
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[1]))
                }
                
                if cards.count == 3 {
                    AnimatedImage(url: URL(string: cards[2].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width / 3, height: 123) // width: 3/1 scale
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[2]))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top) // ２つの場合、top寄せ
        }
        .frame(maxWidth: .infinity, alignment: .leading) // 1つの場合左寄せ
    }
}

struct Layout1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
