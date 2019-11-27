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
}
