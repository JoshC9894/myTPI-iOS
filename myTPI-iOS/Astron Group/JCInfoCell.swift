//
//  JCInfoCell.swift
//  Astron Group
//
//  Created by Joshua Colley on 09/12/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

class JCInfoCell: UITableViewCell {

    @IBOutlet weak var descField: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if numberField != nil{
            STANDARD = numberField.text!
        } else {
            ""
        }
    }

}
