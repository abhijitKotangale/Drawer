//
//  DrawerCell.swift
//  FitnessMaa
//
//  Created by Pawan Ramteke on 06/01/19.
//  Copyright © 2019 iLoma. All rights reserved.
//

import UIKit

class DrawerCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = UIFont.appMediumFont(size: 16)
        lblTitle.textColor = UIColor.darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
