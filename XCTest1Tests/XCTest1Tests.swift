//
//  XCTest1Tests.swift
//  XCTest1Tests
//
//  Created by nsystem on 2019/12/04.
//  Copyright © 2019 nsystem. All rights reserved.
//

import XCTest
@testable import XCTest1

class XCTest1Tests: XCTestCase {
    
    var viewController: ViewController!

    override func setUp() {
        //super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateInitialViewController() as? ViewController
    }

    override func tearDown() {
        //super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
     
    func testかけ算() {
        viewController.loadViewIfNeeded()
        let subClass = viewController.subClass
        let result = subClass?.multiply(num1: 7,num2: 20)
        XCTAssertEqual(result,140)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
