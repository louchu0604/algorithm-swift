//
//  ViewController.swift
//  TestAPP
//
//  Created by louchu on 2017/8/24.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

   func testqueue(object:Int) -> Int {
    let queue = Queue.init()
    queue.push(object)
//        queue.push(object: object)
    
        return 0
    }
    func teststack(object:Int) -> Int {
        return 0
    }
    func teststackbyqueue(object:Int) -> Int {
        return 0
    }
    func testlist(object:Int)->Int
    {
        let list = LinkedList.init()
         list.insertToindex(0, val: 1)
        
        return list.getSize()
    }
    
}

