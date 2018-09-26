//
//  GNBTransaction.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBTransaction: NSObject {
    
    var sku : String?
    var currency : String?
    var amount : String?
    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }
        
        self.currency = dictionary!["currency"] as? String
        self.sku = dictionary!["sku"] as? String
        self.amount = dictionary!["amount"] as? String
    }
}
