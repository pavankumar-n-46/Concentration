//
//  Card.swift
//  Concentration
//
//  Created by Pavan Kumar N on 29/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46  All rights reserved.
//

import Foundation

struct Card {
    var identifier : Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
