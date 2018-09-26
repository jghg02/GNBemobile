//
//  GNBDetailTransactionViewController.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 24/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBDetailTransactionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var allTransactionBySku: [GNBTransaction?] = []
    var gnbDetailPresenter: GNBDetailPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gnbDetailPresenter?.attachView(view: self)
        configUI()
    }
    

    func configUI() -> Void {
        if !self.allTransactionBySku.isEmpty{
            self.title = self.allTransactionBySku.first!?.sku
        }
        
        self.tableView.register(UINib(nibName: "GNBTransactionCell", bundle: nil), forCellReuseIdentifier: "GNBTransactionCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allTransactionBySku.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GNBTransactionCell") as! GNBTransactionCell
        
        cell.displayData(current: allTransactionBySku[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }

}


extension GNBDetailTransactionViewController: GNBDetailProtocol {
    func configViewWithData(data: [GNBTransaction?]) {
        allTransactionBySku = data
    }
    

    

}
