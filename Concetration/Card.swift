//
//  Card.swift
//  Concetration
//
//  Created by SERGEI BRATISHCHEV on 25.12.2017.
//  Copyright © 2017 Sergey Bratischev. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqIdentifier() -> Int {
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
}
