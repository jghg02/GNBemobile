//
//  GNBMainViewControllerTest.swift
//  GNBemobileTests
//
//  Created by Josue Hernandez Gonzalez on 25/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import XCTest
import OCMock

@testable import GNBemobile

class GNBMainViewControllerTest: XCTestCase {
    
    var vc: GNBMainViewController!
    var transactionData = [GNBTransaction]()
    
    override func setUp() {
        super.setUp()
        
        vc = GNBMainViewController()
        vc.loadView()
        vc.viewDidLoad()
        
        let data: NSDictionary = ["sku": "AUD", "currency":"CAD", "amount" : "9999"]
        vc.transactionData = [GNBTransaction(dictionary: data)!]
        
    }
    
    func test_initViewController() {
        XCTAssertNotNil(vc)
    }
    
    func test_setATableView() {
        XCTAssertNotNil(vc.tableView)
    }
    
    func testTableViewHasCells() {
        vc.loadViewIfNeeded()
        
        let cell = vc.tableView.dequeueReusableCell(withIdentifier: "GNBCell") as! GNBCell
        XCTAssertNotNil(cell,"TableView should be able to dequeue cell with identifier: 'GNBCell'")
    }
    
    func test_TableViewDataSources() {
        XCTAssertNotNil(vc.tableView.dataSource is GNBTransaction)
        XCTAssertEqual(vc.transactionData.count, 1)
    }
    
    func test_numberOfRows() {
        let numbersOfRows = vc.tableView.dataSource?.tableView(vc.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numbersOfRows, 1)
    }
    
    func test_forRowCell() {
        
        let table = vc.tableView
        let cell = table?.dataSource?.tableView(table!, cellForRowAt: IndexPath(row: 0, section: 0)) as! GNBCell
        
        XCTAssertNotNil(cell.transactionLabel.text)
        XCTAssertEqual(cell.transactionLabel.text, "Transaction SKU #AUD")
        
    }
        
}
