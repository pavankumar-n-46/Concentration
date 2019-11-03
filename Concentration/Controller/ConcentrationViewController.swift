//
//  ViewController.swift
//  Concentration
//
//  Created by Pavan Kumar N on 26/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46 All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    private(set) var flipCount = 0 {
        didSet {
           updateFlipCount()
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipsLabel: UILabel! {
        didSet {
            updateFlipCount()
        }
    }
    let emojiList = "👻🎃😈🤖🙀👽👾🤡👀"
    private lazy var emojiChoices = emojiList
    private var emoji = [Card:String]()
    
    var theme : String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card was not selected")
        }
    }
    
    @IBAction private func newGamePressed(_ sender: Any) {
        self.game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
        self.flipCount = 0
        self.emojiChoices = emojiList
        updateViewFromModel()
    }
    
    private func updateFlipCount() {
        let attributes : [NSAttributedString.Key : Any ] = [
                       .strokeWidth : 5.0,
                       .strokeColor : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                   ]
                   let attributedString = NSAttributedString(string: "Flips : \(flipCount)", attributes: attributes)
                   flipsLabel.attributedText = attributedString
    }
    
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let card = game.cards[index] //model
                let button = cardButtons[index] //view
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
}

