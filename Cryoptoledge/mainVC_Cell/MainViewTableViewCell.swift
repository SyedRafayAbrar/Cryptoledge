//
//  MainViewTableViewCell.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 09/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var shortname: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var Currencyimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UITableViewCell {
    func setTransparent() {
        let bgView: UIView = UIView()
        bgView.backgroundColor = .clear
        
        self.backgroundView = bgView
        self.backgroundColor = .clear
}
}
