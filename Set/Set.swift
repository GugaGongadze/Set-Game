//
//  Set.swift
//  Set
//
//  Created by Guga Gongadze on 11/27/19.
//  Copyright © 2019 Guga Gongadze. All rights reserved.
//

import Foundation

struct SetGame {
    var cards = [Card]()
    var selectedCards = Set<Card>()
    
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
        print(chosenCard)
        
        if selectedCards.contains(chosenCard) {
            selectedCards.remove(chosenCard)
        } else {
            if selectedCards.count == 2 {
                // Check if a set if formed
                selectedCards.insert(chosenCard)
                print(setCanBeFormed(from: selectedCards))
                if setCanBeFormed(from: selectedCards) {
                    for selectedCard in selectedCards {
                        if let cardIndex = cards.firstIndex(of: selectedCard) {
                            cards.remove(at: cardIndex)
                        }
                    }
                } else {
//                    print(selectedCards)
                    // Decrement score
                }
                
                // Reset selection
                selectedCards = []
            } else {
                selectedCards.insert(chosenCard)
            }
        }
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
