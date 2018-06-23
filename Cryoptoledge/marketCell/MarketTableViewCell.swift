//
//  MarketTableViewCell.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 12/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet weak var blurView: UIVisualEffectView!
    override func awakeFromNib() {
        super.awakeFromNib()
        blurView.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
