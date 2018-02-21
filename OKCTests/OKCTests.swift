//
//  OKCTests.swift
//  OKCTests
//
//  Created by Laticia Chance on 2/20/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import XCTest
@testable import OKC

class OKCTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        super.setUp()
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testExample() {
    }
    
    func testResponse() {
        let url = URL(string: "https://www.okcupid.com/matchSample.json")
        let responseStatusExpectation = expectation(description: "Status code: 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    responseStatusExpectation.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // note to self: this makes the test wait until the func returns/completion is called 
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
