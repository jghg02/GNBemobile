//
//  GNBTransactionCell.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 25/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBTransactionCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!

    func displayData(current: GNBTransaction?) {
        
        self.labelText.text = "\(String(describing: current!.amount!)) - \(String(describing: current!.currency!))"
        
    }
    
}
