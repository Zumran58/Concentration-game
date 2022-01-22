//
//  Concentration2.swift
//  Concentration2
//
//  Created by Zumran Nain on 2022-01-18.
//

import Foundation

class Concentration2
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
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
    
    func chooseCard(at index: Int) {
        
        assert(cards.indices.contains(index), "concentration.choosecard(at: \(index)): chosen index not in the cards")
        
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
                
            } else {
               
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        
        for _ in 1...numberOfPairsOfCards{
            let card=Card()
            cards += [card,card]
           
        }
        
    }
}
