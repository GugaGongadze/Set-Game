//
//  ViewController.swift
//  Set
//
//  Created by Guga Gongadze on 11/20/19.
//  Copyright © 2019 Guga Gongadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var game = SetGame()
    
    @IBOutlet weak var remainingCardsLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func onCardSelection(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
            
        }
    }
    
    @IBAction func onDealMoreCards(_ sender: UIButton) {
        print("Deal 3 More Cards!")
    }
    
    @IBAction func onNewGame(_ sender: UIButton) {
        game = SetGame()
        updateViewFromModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializeCards()
    }
    
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if game.selectedCards.contains(card) {
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
            } else {
                button.layer.borderWidth = 0.0
                button.layer.borderColor = nil
            }
        }
        
        initializeCards()
        remainingCardsLabel.text = "Remaining Cards: \(game.cards.count - 12)"
    }
    
    private func initializeCards() {
        for (index, card) in game.cards[0...11].enumerated() {
            let button = cardButtons[index]
            button.layer.cornerRadius = 8.0
            
            switch card.shape {
            case .Triangle:
                button.setAttributedTitle(NSAttributedString(string: "▲"), for: .normal)
            case .Rectangle:
                button.setAttributedTitle(NSAttributedString(string: "■"), for: .normal)
            case .Oval:
                button.setAttributedTitle(NSAttributedString(string: "●"), for: .normal)
            }
            
            switch card.quantity {
            case .One:
                break
            case .Two:
                let title = button.attributedTitle(for: .normal)
                let newTitle = NSMutableAttributedString()
                newTitle.append(title!)
                newTitle.append(title!)
                
                button.setAttributedTitle(newTitle, for: .normal)
            case .Three:
                let title = button.attributedTitle(for: .normal)
                let newTitle = NSMutableAttributedString()
                newTitle.append(title!)
                newTitle.append(title!)
                newTitle.append(title!)
                
                button.setAttributedTitle(newTitle, for: .normal)
            }
            
            let colorAndFill = (card.color, card.fill)
            switch colorAndFill {
            case (Color.Blue, Fill.Empty):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: Any] = [
                    .strokeWidth: 1,
                    .foregroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Blue, Fill.Striped):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.15)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Blue, Fill.Full):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(100)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Green, Fill.Empty):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: Any] = [
                    .strokeWidth: 1,
                    .foregroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Green, Fill.Striped):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).withAlphaComponent(0.15)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Green, Fill.Full):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).withAlphaComponent(100)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Red, Fill.Empty):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: Any] = [
                    .strokeWidth: 1,
                    .foregroundColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Red, Fill.Striped):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).withAlphaComponent(0.15)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            case (Color.Red, Fill.Full):
                let title = button.attributedTitle(for: .normal)
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).withAlphaComponent(100)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!.string, attributes: attrs), for: .normal)
            }
        }
    }
    
}
