//
//  TradeViewTableViewCell.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 10/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class TradeViewTableViewCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var updownImage: UIImageView!
    @IBOutlet weak var tradeButton: UILabel!
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
