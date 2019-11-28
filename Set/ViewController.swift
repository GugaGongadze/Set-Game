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
                button.setAttributedTitle(NSAttributedString(string: "▲"), for: .normal)
            case .Rectangle:
                button.setAttributedTitle(NSAttributedString(string: "■"), for: .normal)
            case .Oval:
                button.setAttributedTitle(NSAttributedString(string: "●"), for: .normal)
            }
            
            // Determine color
            switch card.color {
            case .Blue:
                button.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
            case .Green:
                button.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
            case .Red:
                button.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
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
                
                button.setAttributedTitle(NSAttributedString(string: title!, attributes: attrs), for: .normal)
            case .Striped:
                let title = button.title(for: .normal)
                let color = button.titleColor(for: .normal)
                
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: color!.withAlphaComponent(0.15)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!, attributes: attrs), for: .normal)
            case .Full:
                let title = button.title(for: .normal)
                let color = button.titleColor(for: .normal)
                
                let attrs: [NSAttributedString.Key: UIColor] = [
                    .foregroundColor: color!.withAlphaComponent(100)
                ]
                
                button.setAttributedTitle(NSAttributedString(string: title!, attributes: attrs), for: .normal)
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
