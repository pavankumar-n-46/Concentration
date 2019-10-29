//
//  ViewController.swift
//  Concentration
//
//  Created by Pavan Kumar N on 26/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46 All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipsLabel.text = "Flips : \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsLabel: UILabel!
    let emojiList = ["👻","🎃","😈","🤖","🙀","👽","👾","🤡","👀"]
    lazy var emojiChoices = emojiList
    var emoji = [Int:String]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card was not selected")
        }
    }
    
    @IBAction func newGamePressed(_ sender: Any) {
        self.game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
        self.flipCount = 0
        self.emojiChoices = emojiList
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let card = game.cards[index] //model
            let button = cardButtons[index] //view
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomNumber = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomNumber)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

