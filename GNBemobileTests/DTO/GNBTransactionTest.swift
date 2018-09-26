//
//  GNBTransactionTest.swift
//  GNBemobileTests
//
//  Created by Josue Hernandez Gonzalez on 25/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import XCTest

@testable import GNBemobile

class GNBTransactionTest: XCTestCase {
    
    func test_initWithDictionary() {
        let transaction = GNBTransaction(dictionary: nil)
        XCTAssertNil(transaction)
    }
    
    
    func test_initWithDictionary_CorrecTypes() {
        let dictionary: NSDictionary = ["sku": "AUD", "currency":"CAD", "amount" : "9999"]
        let transaction = GNBTransaction(dictionary: dictionary)
        
        XCTAssertEqual(transaction?.sku, "AUD")
        XCTAssertEqual(transaction?.currency, "CAD")
        XCTAssertEqual(transaction?.amount, "9999")
        
        
    }
    
}
