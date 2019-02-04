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
    @IBOutlet weak var guessedCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessedLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }

    func updateUIAAfterGuess (){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
    
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    
    func guessALetter() {
       formatUserGuessLabel()
       guessCount += 1
        //decrements the wrongGuessesRemaining and shows the next flower image with one less petal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining -= 1
            flowerImageView.image = UIImage(named: "flower" + "\(wrongGuessesRemaining)")
        }
        
        let revealedWord = userGuessLabel.text!
        //stop game if wrongGuessesRemaining = 0
        if wrongGuessesRemaining == 0{
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessedCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !revealedWord.contains("_"){
            //You have won a game!
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessedCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
            
        } else {
//            var guess = "guesses"
//            if guessCount == 1 {
//                guess = "guess"
//            }
        
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            
            guessedCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
    
    
    
    
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessedLetterButton.isEnabled = true
        } else {
            //disable the button if I dont have a single char in the guessedLetterField
            guessedLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAAfterGuess()
    }
    @IBAction func guessLetterButtonPressed(_ sender: Any) {
        guessALetter()
        updateUIAAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessedLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessedCountLabel.text = "You've made 0 guesses"
        guessCount = 0
        
    }
}

