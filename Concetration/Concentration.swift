//
//  Concentration.swift
//  Concetration
//
//  Created by SERGEI BRATISHCHEV on 25.12.2017.
//  Copyright © 2017 Sergey Bratischev. All rights reserved.
//

import Foundation

class Concentration {
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            
            cards += [card, card]
        }
        
        shuffleCard()
    }
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func shuffleCard() {
        for index in cards.indices {
            for i in 0..<index {
                let j = Int(arc4random_uniform(UInt32(cards.count)))
                let source = cards[i]
                cards[i] = cards[j]
                cards[j] = source
            }
        }
    }
    
    func renewGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        
        shuffleCard()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
