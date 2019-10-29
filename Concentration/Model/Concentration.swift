//
//  Concentration.swift
//  Concentration
//
//  Created by Pavan Kumar N on 29/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    private var indexOfOneAndOnlyFaceupCard : Int?
    
    init(numberOfPairsOfCard : Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            self.cards += [card,card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceupCard, matchIndex != index {
                // when only one card is face up
                if (cards[matchIndex].identifier == cards[index].identifier) {
                    // matched
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //not matched
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceupCard = nil
            } else {
                // either no card is face up or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceupCard = index
            }
        }
    }
    
    
}
