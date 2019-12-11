//
//  XCTest1Tests.swift
//  XCTest1Tests
//
//  Created by nsystem on 2019/12/04.
//  Copyright © 2019 nsystem. All rights reserved.
//

import XCTest
@testable import XCTest1

struct MockDateProtocol: DateProtocol{
    var date: Date? = nil
    func nowx() -> Date {
       return date!
    }
}

class XCTest1Tests: XCTestCase {
    
    var viewController: ViewController!

    override func setUp() {
        //super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateInitialViewController() as? ViewController
        //self.viewController = ViewController()
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
    
    func test足算() {
        //let result = viewController.add(7,20)
        //XCTAssertEqual(result,27,"7 + 20 = 27 の確認")
        XCTAssertEqual(viewController.add(7,20),27,"7 + 20 = 27 の確認")
    }

    func test引算() {
        XCTContext.runActivity(named: "引算A"){ _ in
            XCTAssertEqual(viewController.subtract(20,20),0)
        }
        XCTContext.runActivity(named: "引算B"){ _ in
        }
        XCTContext.runActivity(named: "引算C"){ _ in
            XCTAssertEqual(viewController.subtract(120,20),100)
        }
    }

    func test乗算() {
        XCTAssertEqual(viewController.multiple(25,18),450)
    }

    func test除算() {
        XCTAssertEqual(viewController.division(30,15),2)
    }

    func test非同期() {
        let exp: XCTestExpectation = expectation(description: "wait")
        
        viewController.echo(message: "Good"){(message) in XCTAssertEqual(message, "Good!")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testHoliday(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        var date: Date!
        
        XCTContext.runActivity(named: "金曜日"){ _ in
            date = formatter.date(from: "2019/12/06")
            XCTAssertFalse(viewController.isHoliday(date))
        }

        XCTContext.runActivity(named: "土曜日"){ _ in
            date = formatter.date(from: "2019/12/07")
            XCTAssertTrue(viewController.isHoliday(date))
        }

        XCTContext.runActivity(named: "日曜日"){ _ in
            date = formatter.date(from: "2019/12/08")
            XCTAssertTrue(viewController.isHoliday(date))
        }

        XCTContext.runActivity(named: "月曜日"){ _ in
            date = formatter.date(from: "2019/12/09")
            XCTAssertFalse(viewController.isHoliday(date))
        }

        XCTContext.runActivity(named: "今日"){ _ in
            XCTAssertFalse(viewController.isHoliday())
        }


    }
    
    func testIsHoiliday1(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        var mock = MockDateProtocol()
        
        mock.date = formatter.date(from: "2019/12/10")
        XCTAssertTrue(CalendarUtil(dateProtocol: mock).isHoliday1() )
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
