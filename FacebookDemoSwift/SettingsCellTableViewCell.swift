//
//  SettingsCellTableViewCell.swift
//  FacebookDemoSwift
//
//  Created by Rohit Bhoompally on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SettingsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var typeSwitch: UISwitch!
    @IBOutlet weak var typeLabel: UILabel!
    
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        println("awakeFromNib index = \(index)")
        switch index {
        case 0:
            typeLabel.text = "Links"
        case 1:
            typeLabel.text = "Statuses"
        case 2:
            typeLabel.text = "Photos"
        case 3:
            typeLabel.text = "Videos"
        default:
            println("Bad")
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
