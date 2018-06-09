//
//  TradeViewTableViewCell.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 10/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class TradeViewTableViewCell: UITableViewCell {

    @IBOutlet weak var tradeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        tradeButton.layer.cornerRadius = 6
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
