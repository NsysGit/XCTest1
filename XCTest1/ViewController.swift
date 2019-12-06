//
//  ViewController.swift
//  XCTest1
//
//  Created by nsystem on 2019/12/04.
//  Copyright © 2019 nsystem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var subClass: SubClass!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.subClass = SubClass(viewController: self)
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
}

