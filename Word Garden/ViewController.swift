//
//  ViewController.swift
//  Word Garden
//
//  Created by Kenyan Houck on 2/3/19.
//  Copyright © 2019 Kenyan Houck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessedLetterButton: UIButton!
    @IBOutlet weak var guessedCountLebel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
    }
    func updateUIAAfterGuess (){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAAfterGuess()
    }
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        updateUIAAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
    }
}

