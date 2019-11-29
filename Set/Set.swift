//
//  Set.swift
//  Set
//
//  Created by Guga Gongadze on 11/27/19.
//  Copyright © 2019 Guga Gongadze. All rights reserved.
//

import Foundation

struct SetGame {
    private(set) var cards = [Card]()
    private(set) var selectedCards = Set<Card>()
    private(set) var score = 0
    var numberOfManuallyDealtCards = 0
    
    init() {
        for quantity in Quantity.allCases {
            for color in Color.allCases {
                for fill in Fill.allCases {
                    for shape in Shape.allCases {
                        cards.append(Card(quantity: quantity, color: color, shape: shape, fill: fill))
                    }
                }
            }
        }
        
        cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int) {
        let chosenCard = cards[index]
        
        if selectedCards.contains(chosenCard) {
            selectedCards.remove(chosenCard)
            score -= 1
        } else {
            if selectedCards.count == 2 {
                
                selectedCards.insert(chosenCard)
                
                if setCanBeFormed(from: selectedCards) {
                    for selectedCard in selectedCards {
                        if let cardIndex = cards.firstIndex(of: selectedCard) {
                            cards.remove(at: cardIndex)
                        }
                    }
                    
                    score += 3
                } else {
                    score -= 10
                }
                
                selectedCards = []
                
            } else {
                selectedCards.insert(chosenCard)
            }
        }
    }
    
    mutating func dealMoreCards() {
        score -= 5
    }
    
    private func setCanBeFormed(from cards: Set<Card>) -> Bool {
        var colors = Set<Color>()
        var quantities = Set<Quantity>()
        var shapes = Set<Shape>()
        var fills = Set<Fill>()
        
        for card in cards {
            colors.insert(card.color)
            quantities.insert(card.quantity)
            shapes.insert(card.shape)
            fills.insert(card.fill)
        }
        
        if (colors.count == 1 || colors.count == 3) && (quantities.count == 1 || quantities.count == 3) && (shapes.count == 1 || shapes.count == 3) && (fills.count == 1 || fills.count == 3) {
            return true
        }
        
        return false
    }
}
