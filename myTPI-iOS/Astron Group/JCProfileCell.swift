//
//  JCProfileCell.swift
//  Astron Group
//
//  Created by Joshua Colley on 24/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCProfileCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
