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
    var userDetails: UserDetails!
    var location: Location!
    var photo: Photo!
    
    override func setUp() {
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        
        location = Location(countryName: "United States", countryCode: "US", stateName: "New York", cityName: "Brooklyn", stateCode: "NY")
        
        guard let large = URL(string:"https://k3.okccdn.com/php/load_okc_image.php/images/0x0/640x560/36x36/684x684/0/15743311334557165678.jpg") else { return }
        guard let small = URL(string: "https://k2.okccdn.com/php/load_okc_image.php/images/0x0/60x60/36x36/684x684/0/15743311334557165678.jpg") else { return }
        guard let medium = URL(string: "https://k2.okccdn.com/php/load_okc_image.php/images/0x0/120x120/36x36/684x684/0/15743311334557165678.jpg") else { return }
        guard let original = URL(string: "https://k2.okccdn.com/php/load_okc_image.php/images/36x36/684x684/0/15743311334557165678.jpg") else { return }
        
        photo = Photo(large: large, small: small, medium: medium, original: original)
        userDetails = UserDetails(age: 27, match: 8715, username: "bklyn2356", location: location , photo: photo)
        
        super.setUp()
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
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
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUserAge() {
        XCTAssertEqual(userDetails.age, 27)
    }
    
    func testMatchPercentage() {
        XCTAssertEqual(userDetails.match/100, 87)
    }
    
    func testUsername() {
        XCTAssertEqual(userDetails.username, "bklyn2356")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
