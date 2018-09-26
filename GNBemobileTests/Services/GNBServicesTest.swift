//
//  GNBServicesTest.swift
//  GNBemobileTests
//
//  Created by Josue Hernandez Gonzalez on 25/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import XCTest
import OCMock
import Alamofire

@testable import GNBemobile

class GNBServicesTest: XCTestCase {
    
    var services: GNBServices?
    

    override func setUp() {
        super.setUp()
        services = GNBServices()
    }
    
    func testCanBeCreateService() {
        XCTAssertNotNil(services)
    }
    
    
    func test_getData_fromGetTransactionRequest() {

        let expectations = expectation(description: "The Response result match the expected results")
        
        if let requestUrl = URL(string: "http://quiet-stone-2094.herokuapp.com/transactions.json") {
            
            let request = Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            request.responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let result):
                    XCTAssertNotNil(result)
                    //finally fullfill the expectation
                    expectations.fulfill()
                case .failure(let error):
                    //this is failed case
                    XCTFail("Server response failed : \(error.localizedDescription)")
                    expectations.fulfill()
                }
            })
            
            //wait for some time for the expectation (you can wait here more than 30 sec, depending on the time for the response)
            waitForExpectations(timeout: 30, handler: { (error) in
                if let error = error {
                    print("Failed : \(error.localizedDescription)")
                }
                
            })

        }
    }
    
    func test_getData_fromGetRatesRequest() {
        
        let expectations = expectation(description: "The Response result match the expected results")
        
        if let requestUrl = URL(string: "http://quiet-stone-2094.herokuapp.com/rates.json") {
            
            let request = Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            request.responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let result):
                    XCTAssertNotNil(result)
                    //finally fullfill the expectation
                    expectations.fulfill()
                case .failure(let error):
                    //this is failed case
                    XCTFail("Server response failed : \(error.localizedDescription)")
                    expectations.fulfill()
                }
            })
            
            //wait for some time for the expectation (you can wait here more than 30 sec, depending on the time for the response)
            waitForExpectations(timeout: 30, handler: { (error) in
                if let error = error {
                    print("Failed : \(error.localizedDescription)")
                }
                
            })
            
        }
    }
        
    
}
