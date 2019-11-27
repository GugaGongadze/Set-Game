//
//  Card.swift
//  Set
//
//  Created by Guga Gongadze on 11/27/19.
//  Copyright © 2019 Guga Gongadze. All rights reserved.
//

import Foundation

enum Quantity: CaseIterable {
    case One
    case Two
    case Three
}

enum Color: CaseIterable {
    case Red
    case Blue
    case Green
}

enum Shape: CaseIterable {
    case Triangle
    case Rectangle
    case Oval
}

enum Fill: CaseIterable {
    case Empty
    case Striped
    case Full
}

struct Card {
    let quantity: Quantity
    let color: Color
    let shape: Shape
    let fill: Fill
}
