//
//  GNBPresenter.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBPresenter: NSObject {
    
    private let gnbServices: GNBServices
    weak private var gnbProtocol: GNBProtocol?

    init(gnbServices: GNBServices) {
        self.gnbServices = gnbServices
    }

    func attachView(view: GNBProtocol) -> Void {
        gnbProtocol = view
    }
    
    func detachView() {
        gnbProtocol = nil
    }
    
    func getRates() -> Void {
        let loading = self.gnbProtocol?.startLoading()
        GNBServices.fetchRates { [weak self] rates in
            self?.gnbProtocol?.finishLoading(loading: loading!)
            
        }
    }
    
    func getTransactions() -> Void {
        let loading = self.gnbProtocol?.startLoading()
        GNBServices.getTransactions { [weak self] transactions in
            self?.gnbProtocol?.finishLoading(loading: loading!)
            if transactions?.count != 0 {
                self?.gnbProtocol?.configViewWithData(data: transactions!)
            }
        }
    }
    
    func processAction(navigation: UINavigationController!, selected: GNBTransaction!, allTransaction: [GNBTransaction])  {
        if (navigation != nil) {
            let vc = GNBDetailTransactionViewController(nibName: "GNBDetailTransactionViewController", bundle: nil)
            vc.gnbDetailPresenter = GNBDetailPresenter(transactions: getAllTransactionsBySkuSeleted(seletedTransaction: selected, allTransactions: allTransaction))
            navigation.pushViewController(vc, animated: true)
        }
    }
    
    func getAllTransactionsBySkuSeleted(seletedTransaction: GNBTransaction!, allTransactions: [GNBTransaction?]) -> [GNBTransaction?] {
        return allTransactions.filter{ $0?.sku == seletedTransaction.sku }
    }
}
