//
//  JSONViewModel.swift
//  SwiftUI_CompositionalLayout
//
//  Created by park kyung seok on 2021/09/20.
//

import SwiftUI

class JSONViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    
    // Searching string
    @Published var search = ""
    
    // Compositional Layout Array
    @Published var compositionalArray: [[Card]] = []
    
    init() {
        fetchJSON()
    }
    
    func fetchJSON() {
        
        let url = "https://picsum.photos/v2/list?page=2&limit=100"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let json = data else { return }
            
            let jsonValues = try? JSONDecoder().decode([Card].self, from: json)
            
            guard let cards = jsonValues else { return }
            
            DispatchQueue.main.async {
                self.cards = cards
                print("cards: \(cards)")
                
                self.setCompositionalLayout()
            }
        }.resume()
    }
    
    func setCompositionalLayout() {
     
        var currentArrayCards: [Card] = []
        
        cards.forEach { card in
            
            currentArrayCards.append(card)
            
            if currentArrayCards.count == 3 {
                
                // Appending to Main Array
                self.compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
            // 最後のCardが3つ目ではないとき
            if currentArrayCards.count != 3 && card.id == cards.last!.id {
                self.compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
        }
    }
}
