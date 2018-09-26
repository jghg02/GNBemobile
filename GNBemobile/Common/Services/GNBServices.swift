//
//  GNBServices.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class GNBServices: NSObject {
    
    class func fetchRates(completion: @escaping ([GNBRates]?) -> Void) {
        
        Alamofire.request("http://quiet-stone-2094.herokuapp.com/rates.json", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            let tmp : NSMutableArray = []
            
            switch response.result {
            case .failure( _):
                if let data = response.data {
                    print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                }
                //When I get any error return nil
                completion(nil)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                for current in json.arrayValue {
                    tmp.add(GNBRates(dictionary: current.dictionaryObject! as NSDictionary)!)
                }
                
                //Return all Rates from WwebServices
                completion(tmp as NSArray as? [GNBRates])
                
            }
            
        }
        
    }
    
    
    class func getTransactions(completion: @escaping ([GNBTransaction]?) -> Void) {
        
        Alamofire.request("http://quiet-stone-2094.herokuapp.com/transactions.json", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            let tmp : NSMutableArray = []
            
            switch response.result {
            case .failure( _):
                if let data = response.data {
                    print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                }
                //When I get any error return nil
                completion(nil)
                
            case .success(let value):
                let json = JSON(value)
                for current in json.arrayValue {
                    tmp.add(GNBTransaction(dictionary: current.dictionaryObject! as NSDictionary)!)
                }
                
                //Return all Rates from WwebServices
                completion(tmp as NSArray as? [GNBTransaction])
                
            }
            
        }
        
    }

}
