//
//  JCChecklistReport.swift
//  Astron Group
//
//  Created by Joshua Colley on 19/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCChecklistReport: UIViewController {
    
    //Outlets
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var maintenanceField: UITextField!
    @IBOutlet weak var previousExamField: UITextField!
    @IBOutlet weak var previousTestField: UITextField!
    @IBOutlet weak var mainWireCertField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var timesheetField: UITextField!
    @IBOutlet weak var ndtField: UITextField!
    @IBOutlet weak var previousExamDateField: UITextField!
    @IBOutlet weak var previousTestDateField: UITextField!
    @IBOutlet weak var auxWireCertField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var serialField: UITextField!
    @IBOutlet weak var regField: UITextField!
    @IBOutlet weak var counterweightField: UITextField!
    @IBOutlet weak var maxConfigField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var fleetField: UITextField!
    @IBOutlet weak var swlField: UITextField!
    @IBOutlet weak var ballastField: UITextField!
    @IBOutlet weak var currentConfigField: UITextField!
    @IBOutlet weak var standardField: UITextField!
    @IBOutlet weak var boomLength: UITextField!
    @IBOutlet weak var Radius: UITextField!
    
    @IBOutlet weak var manualField: UITextField!
    @IBOutlet weak var fireExtinguisherField: UITextField!
    @IBOutlet weak var idMarkingsField: UITextField!
    @IBOutlet weak var visualField: UITextField!
    @IBOutlet weak var cabinField: UITextField!
    @IBOutlet weak var loadChartField: UITextField!
    
    @IBOutlet weak var chassisField: UITextField!
    @IBOutlet weak var slewingField: UITextField!
    @IBOutlet weak var outriggerField: UITextField!
    @IBOutlet weak var sparkArrestorField: UITextField!
    @IBOutlet weak var brakingField: UITextField!
    @IBOutlet weak var mainWireRopeLabel: UILabel!
    @IBOutlet weak var auxWireRopeLabel: UILabel!
    @IBOutlet weak var trolleyWireRopeLabel: UILabel!
    @IBOutlet weak var hookField: UITextField!
    @IBOutlet weak var tyreField: UITextField!
    @IBOutlet weak var fluidField: UITextField!
    @IBOutlet weak var superstructureField: UITextField!
    @IBOutlet weak var hydraulicField: UITextField!
    @IBOutlet weak var connectionsField: UITextField!
    @IBOutlet weak var wireRopeField: UITextField!
    @IBOutlet weak var cylinderField: UITextField!
    @IBOutlet weak var mainLinePull: UITextField!
    @IBOutlet weak var auxLinePull: UITextField!
    
    @IBOutlet weak var controlField: UITextField!
    @IBOutlet weak var emergencyStopField: UITextField!
    @IBOutlet weak var wiringField: UITextField!
    @IBOutlet weak var overloadField: UITextField!
    @IBOutlet weak var anemometerField: UITextField!
    @IBOutlet weak var earthingField: UITextField!
    @IBOutlet weak var emergencyFunctionField: UITextField!
    @IBOutlet weak var speedField: UITextField!
    @IBOutlet weak var limitSwitchField: UITextField!
    @IBOutlet weak var batteriesField: UITextField!
    @IBOutlet weak var tiltingField: UITextField!
    @IBOutlet weak var lightsField: UITextField!
    @IBOutlet weak var functionsField: UITextField!
    
    @IBOutlet weak var RadiusLabel: UILabel!
    @IBOutlet weak var BoomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BoomLabel.text = boom1
        RadiusLabel.text = radiusString
        
        if mainlinepull != "" {
            mainLinePull.text = mainlinepull
        } else {
            mainLinePull.text = "Not Applicable"
        }
        
        if auxlinepull != "" {
            auxLinePull.text = auxlinepull
        } else {
            auxLinePull.text = "Not Applicable"
        }
        
        if radius1 != "" {
            Radius.text = radius1
        } else {
            Radius.text = "N/A"
        }
        
        if boomlength1 != "" {
            boomLength.text = boomlength1
        } else {
            boomLength.text = "N/A"
        }
        
        clientField.text = client1
        
        if reg1 != "" {
            regField.text = reg1
        } else {
            regField.text = "N/A"
        }
        
        if fleet1 != "" {
            fleetField.text = fleet1
        } else {
            fleetField.text = "N/A"
        }
        
        locationField.text = location1
        makeField.text = make1
        serialField.text = serial1
        modelField.text = model1
        swlField.text = swl1
        descriptionField.text = description1
        
        if maxconfig1 != "" {
            maxConfigField.text = maxconfig1
        } else {
            maxConfigField.text = "N/A"
        }
        
        if currentconfig1 != "" {
            currentConfigField.text = currentconfig1
        } else {
            currentConfigField.text = "N/A"
        }
        
        timesheetField.text = timesheet1
        nameField.text = inspectorsname1
        
        if previouscert1 != "" {
            previousExamField.text = previouscert1
        } else {
            previousExamField.text = "Not Available"
        }
        
        if previousdate1 != "" {
            previousExamDateField.text = previousdate1
        } else {
            previousExamDateField.text = "-"
        }
        
        if loadtestcert1 != "" {
            previousTestField.text = loadtestcert1
        } else {
            previousTestField.text = "Not Available"
        }
        
        
        if loadtestdate1 != "" {
            previousTestDateField.text = loadtestdate1
        } else {
            previousTestDateField.text = "Not Available"
        }
        
        typeField.text = type1
        dateField.text = DATE
        superstructureField.text = superstructure1
        idMarkingsField.text = idmarkings1
        controlField.text = control1
        emergencyStopField.text = emergencystop1
        tiltingField.text = tilting1
        overloadField.text = overload1
        emergencyFunctionField.text = emergencyfunctions1
        wiringField.text = wiring1
        hydraulicField.text = leaking1
        speedField.text = speed1
        slewingField.text = slewing1
        brakingField.text = braking1
        tyreField.text = tyres1
        outriggerField.text = outrigger1
        sparkArrestorField.text = sparkarrestor1
        lightsField.text = lights1
        fireExtinguisherField.text = fireextinguisher1
        wireRopeField.text = wirerope1
        
        
        if mainwire1 == "" {
            mainWireCertField.text = "Not Applicable"
        } else if mainwirecert1 != "" {
            mainWireCertField.text = mainwirecert1
        } else if mainwire1 != "" {
            mainWireCertField.text = "Not Available"
        }
        
        if auxwire1 == "" {
            auxWireCertField.text = "Not Applicable"
        } else if auxwirecert1 != "" {
            auxWireCertField.text = auxwirecert1
        } else if auxwire1 != "" {
            auxWireCertField.text = "Not Available"
        }
        
        if counterweight1 != "" {
            counterweightField.text = counterweight1
        } else {
            counterweightField.text = "Not Applicable"
        }
        
        if ballast1 != "" {
            ballastField.text = ballast1
        } else {
            ballastField.text = "Not Applicable"
        }
        
        visualField.text = visual1
        functionsField.text = functions1
        earthingField.text = earthing1
        manualField.text = manual1
        
        if ndt1 != "" {
            ndtField.text = ndt1
        } else {
            ndtField.text = "No Test Carried Out"
        }
        
        maintenanceField.text = maintenance1
        
        if mainwire1 != ""{
            mainWireRopeLabel.text = mainwire1
        } else {
            mainWireRopeLabel.text = "N/A"
        }
        
        if auxwire1 != "" {
            auxWireRopeLabel.text = auxwire1
        } else {
            auxWireRopeLabel.text = "N/A"
        }
        
        if trolleywire1 != ""{
            trolleyWireRopeLabel.text = trolleywire1
        } else {
            trolleyWireRopeLabel.text = "N/A"
        }
        
        if standard1 != "" {
            standardField.text = standard1
        } else {
            standardField.text = "Local Regulations"
        }
        
        cabinField.text = cabin1
        loadChartField.text = loadchart1
        chassisField.text = chassis1
        fluidField.text = fluid1
        connectionsField.text = connections1
        hookField.text = hook1
        cylinderField.text = cylinder1
        anemometerField.text = anemometer1
        limitSwitchField.text = limit1
        batteriesField.text = batteries1
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
