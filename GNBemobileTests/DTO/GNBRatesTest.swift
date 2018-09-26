//
//  GNBRatesTest.swift
//  GNBemobileTests
//
//  Created by Josue Hernandez Gonzalez on 25/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import XCTest
import Expecta

@testable import GNBemobile

class GNBRatesTest: XCTestCase {
    

    func test_initWithDictionary() {
        let rate = GNBRates(dictionary: nil)
        XCTAssertNil(rate)

    }
        
    func test_initWithDictionary_CorrecTypes() {
        let dictionary: NSDictionary = ["from": "AUD", "to":"CAD", "rate" : "9999"]
        let rate = GNBRates(dictionary: dictionary)
        
        XCTAssertEqual(rate?.from,"AUD")
        XCTAssertEqual(rate?.to,"CAD")
        XCTAssertEqual(rate?.rate,"9999")
        
    }
    
}
