//
//  ViewController.swift
//  Concentration
//
//  Created by Pavan Kumar N on 26/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipsLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsLabel: UILabel!
    
    let emojiList = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("Card number is \(cardNumber)")
            flipCard(withEmoji: emojiList[cardNumber], on: sender)
        } else {
            print("Card was not selected")
        }
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

