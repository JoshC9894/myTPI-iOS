//
//  JCQuestionsCell.swift
//  Astron Group
//
//  Created by Joshua Colley on 24/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCQuestionsCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.backgroundColor = UIColor(red: 0.051, green: 0.200, blue: 0.392, alpha: 1.0)
        textView.layer.backgroundColor = UIColor(red: 0.051, green: 0.200, blue: 0.392, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.cornerRadius = 10

        // Configure the view for the selected state
    }

}
