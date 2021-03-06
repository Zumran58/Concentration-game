//
//  Card.swift
//  Concentration2
//
//  Created by Zumran Nain on 2022-01-18.
//

import Foundation

struct Card
{
    var isFaceUp=false
    var isMatched=false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        
        identifierFactory+=1
        return identifierFactory
        
    }
    
    init() {
        self.identifier=Card.getUniqueIdentifier()
    }
}
