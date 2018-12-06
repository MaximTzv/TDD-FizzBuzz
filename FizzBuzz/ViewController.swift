//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Maxim Tzvetkov on 3/2/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

import UIKit
import SwiftyTimer

class ViewController: UIViewController {

    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    @IBOutlet weak var timerButton: UIButton!
    
    var game: Game?
    var timer = Timer()
    var gameScore: Int? {
        didSet {
            
            guard let unwrappedScore = gameScore else {
                print("gameScore is nil")
                return
            }
            
            numberButton.setTitle("\(unwrappedScore)", for: .normal)
        }
    }
    
    var timerScore: Int? {
        didSet {
            
            guard let unwarppedTime = timerScore else {
                print("timer is nil")
                return
            }
            
            timerButton.setTitle("\(unwarppedTime)", for: .normal)
        }
        
        willSet {
            if timerScore == 1 {
                print("I can smell the roses")
                timer.invalidate()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        gameScore = game?.score
        timerScore = 5
        
        timer = Timer.every(1, {
            self.timerButton.setTitle("\(self.timerScore)", for: .normal)
            self.timerScore! -= 1
        })
        
//        timer.start(modes: .commonModes)
        timer.start(modes: .common)
    }

    func play(move: Move) {
        
        guard let unwrappedGame = game else {
            print("Game is nil")
            return
        }
        
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        if sender == numberButton {
            play(move: .Number)
        } else if sender == fizzButton {
            play(move: .Fizz)
        } else if sender == buzzButton {
            play(move: .Buzz)
        } else {
            play(move: .FizzBuzz)
        }
    }
}
