//
//  BrainTest.swift
//  FizzBuzz
//
//  Created by Maxim Tzvetkov on 3/2/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class BrainTest: XCTestCase {
    
    let brain = Brain()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsDivisibleByThree() {
        let result = brain.isDivisibleByThree(number: 3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = brain.isDivisibleByThree(number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFive() {
        let result = brain.isDivisibleByFive(number: 10)
        XCTAssertEqual(result, true)
    }
    
    func testIsDivisibleByFifteen() {
        let result = brain.isDivisibleByFifteen(number: 30)
        XCTAssertEqual(result, true)
    }
    
    func testSayFizz() {
        let result = brain.check(number: 3)
        XCTAssertEqual(result, .Fizz)
    }
    
    func testSayBuzz() {
        let result = brain.check(number: 5)
        XCTAssertEqual(result, .Buzz)
    }
    
    func testSayFizzBuzz() {
        let result = brain.check(number: 15)
        XCTAssertEqual(result, .FizzBuzz)
    }
    
    func testReturnOneAsString() {
        let result = brain.check(number: 1)
        XCTAssertEqual(result, .Number)
    }
}
