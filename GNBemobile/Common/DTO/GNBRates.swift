//
//  GNBRates.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit


class GNBRates: NSObject {
    
    var to : String?
    var from : String?
    var rate : String?

    
    init?(dictionary: NSDictionary?) {
        if (dictionary == nil) {
            return nil
        }

        self.to = dictionary!["to"] as? String
        self.from = dictionary!["from"] as? String
        self.rate = dictionary!["rate"] as? String
        
    }
    
}
