//
//  beer_advisorTests.swift
//  beer-advisorTests
//
//  Created by Samuel Nelson on 9/16/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit
import XCTest
import beer_advisor

class beer_advisorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCycleImages() {
        // This is an example of a functional test case.
        let obj = BeerData()
        //XCTAssertNotNil(obj.cycleImage, "cycleImage method exists")
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
