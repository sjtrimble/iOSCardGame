//
//  actions.swift
//  CardGame
//
//  Created by Stefanie Fluin on 1/11/17.
//  Copyright © 2017 Stefanie Fluin. All rights reserved.
//

import Foundation

import UIKit

struct Card {
    let value: String
    let suit: String
    let numericalValue: Int
    
    func show() {
        print(value, "of", suit, ":value", numericalValue)
    }
}

class Deck {
    var cards = [Card]()
    init() { // required for classes, not struts
        self.reset() // getting a full deck is the same thing as the reset function
    }
    
    func deal() -> Card? {
        if self.cards.count > 0 {
            let dealtcard = self.cards.remove(at: cards.count-1)
            return dealtcard
        }
        return nil
    }
    
    func reset() {
        let values: [String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suits: [String] = ["Clubs", "Spades", "Hearts", "Diamonds"]
        self.cards = []
        
        for suit in suits {
            for value in 0...values.count-1 {
                let newcard = Card(value: values[value], suit: suit, numericalValue: value+1)
                self.cards.append(newcard)
            }
        }
    }
    
    func shuffle() {
        for i in stride(from: self.cards.count-1, to: 0, by: -1) { // decreases by the number passed in each iterations
            let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
            let temp = self.cards[i]
            self.cards[i] = self.cards[swapCardIndex]
            self.cards[swapCardIndex] = temp
        }
        
    }
    
    func show() { // to show each card in the deck
        for card in self.cards {
            card.show()
        }
    }
}

class Player {
    var name: String
    var hand: [Card]
    init(name: String) {
        self.name = name
        self.hand = [Card]()
    }
    
    func draw(deck: Deck) -> Card? {
        if let drawnCard = deck.deal() {
            self.hand.append(drawnCard)
            return drawnCard
        } else {
            print("Your deck ran out of cards!")
            return nil
        }
    }
    
    func discard(suit: String, value: String) -> Bool {
        for i in 0...self.hand.count-1 {
            if self.hand[i].suit == suit && self.hand[i].value == value {
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func show() {
        for card in self.hand {
            card.show()
        }
    }
}
//var myDeck = Deck()
////myDeck.show()
////myDeck.shuffle()
//let myCard = myDeck.deal()
//if let thisCard = myCard {
//    print(thisCard)
//}
//let myPlayer: Player = Player(name: "Stefanie")
//myPlayer.draw(deck: myDeck)
//myPlayer.show()
//var discarding = myPlayer.discard(suit: "Clubs", value: "6")
//print(discarding)

