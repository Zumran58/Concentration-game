//
//  ViewController.swift
//  Concentration2
//
//  Created by Zumran Nain on 2022-01-17.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration2(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardbuttons.count+1)/2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text="Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    @IBOutlet private var cardbuttons: [UIButton]!
    

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardbuttons.firstIndex(of: sender){
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }
        else{
            print(cardbuttons.firstIndex(of: sender))
        
            print("print chosen card not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardbuttons.indices {
    
            let button = cardbuttons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                
                button.backgroundColor=UIColor.white
                
            } else {
                button.setTitle("", for: UIControl.State.normal)
                
                button.backgroundColor=card.isMatched ? UIColor.clear : UIColor.orange
                }
            
        }
    }
    
    private var emojiChoices = ["🦇", "😱", "🙀",  "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    private var emoji = [Int:String]()
    

    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            
        }
        return emoji[card.identifier] ?? "?"
        
        }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
}
}


    
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton)
    {
    
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            
            button.backgroundColor=UIColor.orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            
            button.backgroundColor=UIColor.white
        }
        
    }
    


