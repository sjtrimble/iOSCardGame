
//  ViewController.swift
//  CardGame
//
//  Created by Stefanie Fluin on 1/11/17.
//  Copyright © 2017 Stefanie Fluin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var top1Card: UIImageView!
    @IBOutlet weak var top2Card: UIImageView!
    @IBOutlet weak var top3Card: UIImageView!
    @IBOutlet weak var bottom1Card: UIImageView!
    @IBOutlet weak var bottom2Card: UIImageView!
    @IBOutlet weak var bottom3Card: UIImageView!
    
//    var imagesArray = [top1Card, top2Card, top3Card, bottom1Card, bottom2Card, bottom3Card]

    var currentDeck: Deck!
    var playerOne: Player!
    var currentCard: String

    override func viewDidLoad() {
        super.viewDidLoad()
        gameLabel.text = "The Cardattack Game"
        currentDeck = Deck()
        playerOne = Player(name: "Stefanie")
        playerOne.draw(deck: currentDeck)
        welcomeLabel.text = "Welcome \(playerOne.name)"
        hideCards()
    }
    

    @IBAction func dealButtonPressed(_ sender: UIButton) {
        currentDeck.shuffle()
        flipAllCards()
        showCards()
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        let drawnCard = playerOne.draw(deck: currentDeck)
        if let cardInfo = drawnCard {
            print(cardInfo)
            var suitCode: String = ""
            if cardInfo.suit == "Clubs" {
                suitCode = "c"
            } else if cardInfo.suit == "Hearts" {
                suitCode = "h"
            } else if cardInfo.suit == "Diamonds" {
                suitCode = "d"
            } else if cardInfo.suit == "Spades" {
                suitCode = "s"
            }
            let imageFileCode = ("\(suitCode)\(cardInfo.value)")
            let imageFileName = ("\(imageFileCode).png")
            print(imageFileName)
            top2Card.image = UIImage(named: "\(imageFileName.lowercased())")
        }
    }
    
    
    @IBAction func discardButtonPressed(_ sender: UIButton) {
        top2Card.isHidden = true
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        currentDeck.reset()
        currentDeck.shuffle()
        flipAllCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func flipAllCards() {
        top1Card.image = UIImage(named: "b1fv.png")
        top2Card.image = UIImage(named: "b1fv.png")
        top3Card.image = UIImage(named: "b1fv.png")
        bottom1Card.image = UIImage(named: "b1fv.png")
        bottom2Card.image = UIImage(named: "b1fv.png")
        bottom3Card.image = UIImage(named: "b1fv.png")
    }
    
    func hideCards() {
        top1Card.isHidden = true
        top2Card.isHidden = true
        top3Card.isHidden = true
        bottom1Card.isHidden = true
        bottom2Card.isHidden = true
        bottom3Card.isHidden = true
    }

    func showCards() {
        top1Card.isHidden = false
        top2Card.isHidden = false
        top3Card.isHidden = false
        bottom1Card.isHidden = false
        bottom2Card.isHidden = false
        bottom3Card.isHidden = false
    }
    
}

