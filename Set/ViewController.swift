//
//  ViewController.swift
//  Set
//
//  Created by Guga Gongadze on 11/20/19.
//  Copyright © 2019 Guga Gongadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let game = SetGame()
    
    @IBOutlet var cards: [UIButton]!
    
    @IBAction func onDealMoreCards(_ sender: UIButton) {
        print("Deal 3 More Cards!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for (index, card) in game.cards[0...11].enumerated() {
            print(card)
            let button = cards[index]
            
            // Determine shape
            switch card.shape {
            case .Triangle:
                button.setTitle("▲", for: .normal)
            case .Rectangle:
                button.setTitle("■", for: .normal)
            case .Oval:
                button.setTitle("●", for: .normal)
            }
            
            // Determine color
            switch card.color {
            case .Blue:
                button.setTitleColor(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), for: .normal)
            case .Green:
                button.setTitleColor(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), for: .normal)
            case .Red:
                button.setTitleColor(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), for: .normal)
            }
            
            // Determine fill
            switch card.fill {
            case .Empty:
                let title = button.title(for: .normal)
                let color = button.titleColor(for: .normal)
                
                let attrs: [NSAttributedString.Key: Any] = [
                    .strokeWidth: 1,
                    .strokeColor: color!
                ]
                
                let attr = NSAttributedString(string: title!, attributes: attrs)
                button.setAttributedTitle(attr, for: .normal)
            case .Striped:
                let title = button.title(for: .normal)
                let color = button.titleColor(for: .normal)
                
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: color!.withAlphaComponent(0.15)
                ]
                
                let attr = NSAttributedString(string: title!, attributes: attrs)
                button.setAttributedTitle(attr, for: .normal)
            case .Full:
                let title = button.title(for: .normal)
                let color = button.titleColor(for: .normal)
                
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: color!.withAlphaComponent(100)
                ]
                
                let attr = NSAttributedString(string: title!, attributes: attrs)
                button.setAttributedTitle(attr, for: .normal)
            }
            
            // Determine quantity
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
        }
    }


}

