//
//  ViewController.swift
//  XCTest1
//
//  Created by nsystem on 2019/12/04.
//  Copyright © 2019 nsystem. All rights reserved.
//

import UIKit
// import Foundation

class ViewController: UIViewController {
    
    var subClass: SubClass!
    // var calendarUtil: CalendarUtil!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.subClass = SubClass(viewController: self)

        // echo(message: "Hello"){(message) in print(message)}

        let isHol = CalendarUtil().isHoliday1()
        print(isHol)

    }

    class SubClass{
        private let viewController: ViewController
        
        init(viewController: ViewController){
            self.viewController = viewController
        }
        
        func multiply(num1: Int, num2: Int) -> Int {
            return num1 * num2
        }
    }
    
    // 足算
    func add(_ x: Int, _ y: Int) -> Int {
        return x + y
    }
    
    // 引算
    func subtract(_ x: Int, _ y: Int) -> Int {
        return x - y
    }
    
    // 乗算
    func multiple(_ x: Int, _ y: Int) -> Int {
        return x * y
    }
    
    // 除算
    func division(_ x: Int, _ y: Int) -> Int {
        return x / y
    }

    func echo(message: String,_ handler: @escaping(String) -> Void) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3)
            print("非同期")
            DispatchQueue.global().async {
                handler("\(message)!")
            }

        }
        DispatchQueue.global().sync {
            print("同期")
        }
        DispatchQueue.global().async(flags: .barrier) {
            Thread.sleep(forTimeInterval: 3)
            print("非同期A")
        }
        DispatchQueue.global().async(flags: .barrier) {
            Thread.sleep(forTimeInterval: 1)
            print("非同期B")
        }

    }
    
    func isHoliday(_ date:Date = Date()) -> Bool{
        
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        return weekday == 1 || weekday == 7 || weekday == 4
    }

}

protocol DateProtocol{
    func nowx() -> Date
}

class DateDefault: DateProtocol{
    func nowx() -> Date{
        return Date()
    }
}

class CalendarUtil{
    let dateProtocolx: DateProtocol
    
    init(dateProtocol: DateProtocol = DateDefault()){
        self.dateProtocolx = dateProtocol
    }
    
    func isHoliday1() -> Bool {
        let now = dateProtocolx.nowx()
        
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: now)
        
        return weekday == 1 || weekday == 7 || weekday == 4
    }
}


