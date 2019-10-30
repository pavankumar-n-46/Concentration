//
//  Card.swift
//  Concentration
//
//  Created by Pavan Kumar N on 29/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46  All rights reserved.
//

import Foundation

struct Card : Hashable
{
    private var identifier : Int
    var isFaceUp = false
    var isMatched = false

    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
