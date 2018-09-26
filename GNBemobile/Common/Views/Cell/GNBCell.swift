//
//  GNBCell.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

class GNBCell: UITableViewCell {

    @IBOutlet weak var transactionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayData(data: GNBTransaction?) -> Void {
        self.transactionLabel.text = "Transaction SKU #\(String(describing: data!.sku!))"
        
    }
    
}
