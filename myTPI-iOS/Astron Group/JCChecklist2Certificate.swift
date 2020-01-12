//
//  JCChecklist2Certificate.swift
//  Astron Group
//
//  Created by Joshua Colley on 19/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCChecklist2Certificate: UIViewController {
    
    //Outlets
    @IBOutlet weak var swl1Field: UITextField!
    @IBOutlet weak var swl2Field: UITextField!
    @IBOutlet weak var swl3Field: UITextField!
    @IBOutlet weak var swl4Field: UITextField!
    @IBOutlet weak var appliedLoad1Field: UITextField!
    @IBOutlet weak var appliedLoad2Field: UITextField!
    @IBOutlet weak var appliedLoad3Field: UITextField!
    @IBOutlet weak var appliedLoad4Field: UITextField!
    @IBOutlet weak var boomLength1Field: UITextField!
    @IBOutlet weak var boomLength2Field: UITextField!
    @IBOutlet weak var boomLength3Field: UITextField!
    @IBOutlet weak var boomLength4Field: UITextField!
    @IBOutlet weak var radius1Field: UITextField!
    @IBOutlet weak var radius2Field: UITextField!
    @IBOutlet weak var radius3Field: UITextField!
    @IBOutlet weak var radius4Field: UITextField!
    @IBOutlet weak var testInfoField: UITextField!
    @IBOutlet weak var comments1Field: UITextField!
    @IBOutlet weak var comments4Field: UITextField!
    @IBOutlet weak var creepingField: UITextField!
    @IBOutlet weak var unit1Label: UILabel!
    @IBOutlet weak var unit2Label: UILabel!
    @IBOutlet weak var unit3Label: UILabel!
    @IBOutlet weak var unit4Label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if swl11 == "" {
            swl1Field.text = "-"
        } else {
            swl1Field.text = swl11
        }
        if swl21 == "" {
            swl2Field.text = "-"
        } else {
            swl2Field.text = swl21
        }
        if swl31 == "" {
            swl3Field.text = "-"
        } else {
            swl3Field.text = swl31
        }
        if swl41 == "" {
            swl4Field.text = "-"
        } else {
            swl4Field.text = swl41
        }
        
        if appliedload11 == "" {
            appliedLoad1Field.text = "-"
        } else {
            appliedLoad1Field.text = appliedload11
        }
        if appliedload21 == "" {
            appliedLoad2Field.text = "-"
        } else {
            appliedLoad2Field.text = appliedload21
        }
        if appliedload31 == "" {
            appliedLoad3Field.text = "-"
        } else {
            appliedLoad3Field.text = appliedload31
        }
        if appliedload41 == "" {
            appliedLoad4Field.text = "-"
        } else {
            appliedLoad4Field.text = appliedload41
        }
        
        if boomlength11 == "" {
            boomLength1Field.text = "-"
        } else {
            boomLength1Field.text = boomlength11
        }
        if boomlength21 == "" {
            boomLength2Field.text = "-"
        } else {
            boomLength2Field.text = boomlength21
        }
        if boomlength31 == "" {
            boomLength3Field.text = "-"
        } else {
            boomLength3Field.text = boomlength31
        }
        if boomlength41 == "" {
            boomLength4Field.text = "-"
        } else {
            boomLength4Field.text = boomlength41
        }
        
        if radius11 == "" {
            radius1Field.text = "-"
        } else {
            radius1Field.text = radius11
        }
        if radius21 == "" {
            radius2Field.text = "-"
        } else {
            radius2Field.text = radius21
        }
        if radius31 == "" {
            radius3Field.text = "-"
        } else {
            radius3Field.text = radius31
        }
        if radius41 == "" {
            radius4Field.text = "-"
        } else {
            radius4Field.text = radius41
        }
        
        if testinfo1 != "" {
        testInfoField.text = testinfo1
        } else {
            testInfoField.text = "No Additional Information"
        }
        
        if defects1 != "" {
        comments1Field.text = defects1
        } else {
            comments1Field.text = "No Defects Found."
        }
        
        if recommendations1 != ""{
        comments4Field.text = recommendations1
        }else {
            comments4Field.text = "No Recommendations Found."
        }
        
        if creeping1 != "" {
        creepingField.text = creeping1
        } else {
            creepingField.text = "Nil"
        }
        
        unit1Label.text = weight1
        unit2Label.text = weight1
        unit3Label.text = length1
        unit4Label.text = length1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
