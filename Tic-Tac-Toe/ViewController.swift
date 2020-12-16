//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Haoxuan Sun on 12/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStatenavBar: UINavigationBar!
    
    @IBOutlet var gameBoardButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateView()
    }

    @IBAction func pressedNewGame(_ sender: Any) {
        print("New Game")
        
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let button = sender as! UIButton
        print(button.tag)
        updateView()
    }
    
    func updateView() {
        
    }
}

