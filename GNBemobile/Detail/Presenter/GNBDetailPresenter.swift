//
//  GNBDetailPresenter.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 24/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBDetailPresenter: NSObject {
    
    var gnbDetailProtocol: GNBDetailProtocol?
    var gnbTransactions: [GNBTransaction?]

    init(transactions: [GNBTransaction?]) {
        self.gnbTransactions = transactions
    }
    
    func attachView(view: GNBDetailProtocol) {
        gnbDetailProtocol = view
        self.gnbDetailProtocol?.configViewWithData(data: self.gnbTransactions)
    }
    
    func detachView() {
        gnbDetailProtocol = nil
    }
}
