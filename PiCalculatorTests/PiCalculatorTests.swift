//
//  PiCalculatorTests.swift
//  PiCalculatorTests
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import XCTest
@testable import PiCalculator

class PiCalculatorTests: XCTestCase {
    let piCalculateService = PiCalculateService()
    let elapsedTimerService = ElapsedTimerService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            self.piCalculateService.PiAlgorithm()
        }
    }
    
    func testPiAlgorithm(){
        XCTAssertNotNil(piCalculateService.PiAlgorithm(), "should have Pi")
    }
    
    func testElapsedTimer(){
        elapsedTimerService.start()
        XCTAssertNotNil(elapsedTimerService.timer, "should have timer")

    }
    
}
