//
//  foodpinTests.swift
//  foodpinTests
//
//  Created by 薛菁 on 16/3/17.
//  Copyright © 2016年 Jesse. All rights reserved.
//

import XCTest
@testable import foodpin


class foodpinTests: XCTestCase {
    
    var vc : RestaurantTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        func testSearchFilter(){
            
        }
        
        
        vc = storyBoard.instantiateViewControllerWithIdentifier("restaurantTableView") as! RestaurantTableViewController
        
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
        }
    }
    
}
