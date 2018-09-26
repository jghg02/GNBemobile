//
//  GNBDetailTransactionViewControllerTest.swift
//  GNBemobileTests
//
//  Created by Josue Hernandez Gonzalez on 26/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import XCTest

@testable import GNBemobile

class GNBDetailTransactionViewControllerTest: XCTestCase {
    
    var vc: GNBDetailTransactionViewController!
    var allTransactionBySku: [GNBTransaction?] = []
    
    override func setUp() {
        super.setUp()
        vc = GNBDetailTransactionViewController()
        vc.loadView()
        vc.viewDidLoad()
        
        let data: NSDictionary = ["sku": "AUD", "currency":"CAD", "amount" : "9999"]
        vc.allTransactionBySku = [GNBTransaction(dictionary: data)!]
    }
    
    func test_initViewController() {
        XCTAssertNotNil(vc)
    }
    
    func test_setATableView() {
        XCTAssertNotNil(vc.tableView)
    }
    
    func testTableViewHasCells() {
        vc.loadViewIfNeeded()
        
        let cell = vc.tableView.dequeueReusableCell(withIdentifier: "GNBTransactionCell") as! GNBTransactionCell
        XCTAssertNotNil(cell,"TableView should be able to dequeue cell with identifier: 'GNBTransactionCell'")
    }
    
    func test_TableViewDataSources() {
        XCTAssertNotNil(vc.tableView.dataSource is GNBTransaction)
        XCTAssertEqual(vc.allTransactionBySku.count, 1)
    }
    
    func test_numberOfRows() {
        let numbersOfRows = vc.tableView.dataSource?.tableView(vc.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numbersOfRows, 1)
    }
    
    func test_forRowCell() {
        
        let table = vc.tableView
        let cell = table?.dataSource?.tableView(table!, cellForRowAt: IndexPath(row: 0, section: 0)) as! GNBTransactionCell
        
        XCTAssertNotNil(cell.labelText.text)
        XCTAssertEqual(cell.labelText.text, "9999 - CAD")
        
    }
    
    
    
}
