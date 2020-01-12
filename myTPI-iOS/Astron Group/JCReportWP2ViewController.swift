//
//  JCReportWP2ViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 14/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCReportWP2ViewController: UIViewController {
        
    //outlets
    
    @IBOutlet weak var mainLinePullLabel: UILabel!
    @IBOutlet weak var auxLinePullLabel: UILabel!
    
    @IBOutlet weak var superstructureLabel: UILabel!
    @IBOutlet weak var idMarkingsLabel: UILabel!
    @IBOutlet weak var controlsLabel: UILabel!
    @IBOutlet weak var emergencyStopLabel: UILabel!
    @IBOutlet weak var tiltingLabel: UILabel!
    @IBOutlet weak var overloadLabel: UILabel!
    @IBOutlet weak var emergencyFunctionsLabel: UILabel!
    @IBOutlet weak var electricalSystemLabel: UILabel!
    @IBOutlet weak var hydraulicSystemLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var slewingField: UILabel!
    @IBOutlet weak var brakingLabel: UILabel!
    @IBOutlet weak var tyreLabel: UILabel!
    @IBOutlet weak var outriggerLabel: UILabel!
    @IBOutlet weak var sparkArrestorLabel: UILabel!
    @IBOutlet weak var lightsLabel: UILabel!
    @IBOutlet weak var fireExtinguisherLabel: UILabel!
    @IBOutlet weak var wireRopeLabel: UILabel!
    @IBOutlet weak var mainWireCertLabel: UILabel!
    @IBOutlet weak var auxWireCertLabel: UILabel!
    @IBOutlet weak var counterweightLabel: UILabel!
    @IBOutlet weak var ballastLabel: UILabel!
    @IBOutlet weak var visualConditionLabel: UILabel!
    @IBOutlet weak var functionsLabel: UILabel!
    @IBOutlet weak var earthingLabel: UILabel!
    @IBOutlet weak var manualField: UILabel!
    @IBOutlet weak var ndtLabel: UILabel!
    @IBOutlet weak var maintenanceLabel: UILabel!
    @IBOutlet weak var inspectorsNameLabel: UILabel!
    @IBOutlet weak var mainWireLabel: UILabel!
    @IBOutlet weak var auxWireLabel: UILabel!
    @IBOutlet weak var trolleyWireLabel: UILabel!
    @IBOutlet weak var dateField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mainlinepull != "" {
            mainLinePullLabel.text = mainlinepull
        } else {
            mainLinePullLabel.text = "Not Applicable"
        }
        
        if auxlinepull != "" {
            auxLinePullLabel.text = auxlinepull
        } else {
            auxLinePullLabel.text = "Not Applicable"
        }
        
        superstructureLabel.text = superstructure1
        idMarkingsLabel.text = idmarkings1
        controlsLabel.text = control1
        emergencyStopLabel.text = emergencystop1
        tiltingLabel.text = tilting1
        overloadLabel.text = overload1
        emergencyFunctionsLabel.text = emergencyfunctions1
        electricalSystemLabel.text = wiring1
        hydraulicSystemLabel.text = leaking1
        speedLabel.text = speed1
        slewingField.text = slewing1
        brakingLabel.text = braking1
        tyreLabel.text = tyres1
        outriggerLabel.text = outrigger1
        sparkArrestorLabel.text = sparkarrestor1
        lightsLabel.text = lights1
        fireExtinguisherLabel.text = fireextinguisher1
        wireRopeLabel.text = wirerope1
        
        if mainwire1 == "" {
            mainWireCertLabel.text = "Not Applicable"
        } else if mainwirecert1 != "" {
            mainWireCertLabel.text = mainwirecert1
        } else if mainwire1 != "" {
            mainWireCertLabel.text = "Not Available"
        }
        
        if auxwire1 == "" {
            auxWireCertLabel.text = "Not Applicable"
        } else if auxwirecert1 != "" {
            auxWireCertLabel.text = auxwirecert1
        } else if auxwire1 != "" {
            auxWireCertLabel.text = "Not Available"
        }
        
        if counterweight1 != "" {
            counterweightLabel.text = counterweight1
        } else {
            counterweightLabel.text = "Not Applicable"
        }
        
        if ballast1 != "" {
            ballastLabel.text = ballast1
        } else {
            ballastLabel.text = "Not Applicable"
        }
        
        visualConditionLabel.text = visual1
        functionsLabel.text = functions1
        earthingLabel.text = earthing1
        
        if creeping1 != "" {
            manualField.text = creeping1
        }else {
            manualField.text = "Nil"
        }
        
        if ndt1 != "" {
            ndtLabel.text = ndt1
        } else {
            ndtLabel.text = "No Test Carried Out"
        }
        
        maintenanceLabel.text = maintenance1
        overloadLabel.text = overload1
        tiltingLabel.text = tilting1
        emergencyFunctionsLabel.text = emergencyfunctions1
        inspectorsNameLabel.text = inspectorsname1
        
        if mainwire1 != "" {
            mainWireLabel.text = mainwire1
        } else {
            mainWireLabel.text = "N/A"
        }
        
        if auxwire1 != "" {
            auxWireLabel.text = auxwire1
        } else {
            auxWireLabel.text = "N/A"
        }
        
        if trolleywire1 != "" {
            trolleyWireLabel.text = trolleywire1
        } else {
            trolleyWireLabel.text = "N/A"
        }
        
        dateField.text = DATE
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
