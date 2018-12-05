//
//  ViewControllerTests.swift
//  FizzBuzz
//
//  Created by Maxim Tzvetkov on 3/2/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewControllerTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.keyWindow?.rootViewController = vc
        
        let _ = vc.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMoveOneIncrementsScore() {
        vc.play(move: .Number)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 1)
    }
    
    func testMoveTwoIncementsScore() {
        vc.play(move: .Number)
        vc.play(move: .Number)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 2)
    }
    
    func testHasAGame() {
        XCTAssertNotNil(vc.game)
    }
    
    func testFizzIncrementScore() {
        vc.game?.score = 2
        vc.play(move: .Fizz)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 3)
    }
    
    func testBuzzIncrementScore() {
        vc.game?.score = 4
        vc.play(move: .Buzz)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 5)
    }
    
    func testFizzBuzzIncrementScore() {
        vc.game?.score = 14
        vc.play(move: .FizzBuzz)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 15)
    }
    
    func testWrongMoveScoreNotIncremented() {
        vc.play(move: .Fizz)
        let newScore = vc.gameScore
        XCTAssertEqual(newScore, 0)
    }
}
