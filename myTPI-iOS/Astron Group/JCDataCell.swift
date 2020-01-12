//
//  JCDataCell.swift
//  Astron Group
//
//  Created by Joshua Colley on 26/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

class JCDataCell: UITableViewCell {
    @IBOutlet weak var descritionLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var workingLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var reachLabel: UILabel!
    @IBOutlet weak var swlLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if descritionLabel.text != nil{
            desc = descritionLabel.text!
        }else {
            ""
        }
        
        if makeLabel.text != nil{
            make = makeLabel.text!
        }else {
            ""
        }
        
        if modelLabel.text != nil{
            model = modelLabel.text!
        }else {
            ""
        }
        
        if workingLabel.text != nil{
            wh = workingLabel.text!
        }else {
            ""
        }
        
        if platformLabel.text != nil{
            ph = platformLabel.text!
        }else {
            ""
        }
        
        if reachLabel.text != nil{
            reach = reachLabel.text!
        }else {
            ""
        }
        
        if swlLabel.text != nil{
            swlSelected = swlLabel.text!
        }else {
            ""
        }
    }
}
