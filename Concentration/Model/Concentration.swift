//
//  Concentration.swift
//  Concentration
//
//  Created by Pavan Kumar N on 29/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceupCard : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCard : Int) {
        assert(numberOfPairsOfCard > 0, "Concentration.init(\(numberOfPairsOfCard)): numberOfPairsOfcard had to be more than zero")
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            self.cards += [card,card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in card.")
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
            } else {
                indexOfOneAndOnlyFaceupCard = index
            }
        }
    }
    
    
}
