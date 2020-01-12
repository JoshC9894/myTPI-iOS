//
//  JCChecksheetTableViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 13/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import Parse
import CoreLocation



let sixmonths = (Calendar.current as NSCalendar).date(
    byAdding: .day,
    value: 365/2,
    to: Date(),
    options: NSCalendar.Options(rawValue: 0))

let twelvemonths = (Calendar.current as NSCalendar).date(
    byAdding: .day,
    value: 365,
    to: Date(),
    options: NSCalendar.Options(rawValue: 0))

let fouryears = (Calendar.current as NSCalendar).date(
    byAdding: .day,
    value: 365*4,
    to: Date(),
    options: NSCalendar.Options(rawValue: 0))

class JCChecksheetTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //CoreData
    var inspection : Inspection? = nil
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext

    //Outlet
    @IBOutlet weak var maintenancePicker: UIPickerView!
    
    @IBOutlet weak var recommendationsText: UITextField!
    @IBOutlet weak var defectsText: UITextField!

    @IBOutlet weak var cheat1Label: UILabel!
    @IBOutlet weak var date1Field: UITextField!
    @IBOutlet weak var typeField: UILabel!

    @IBOutlet weak var maintenanceField: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timesheetField: UITextField!

    @IBOutlet weak var ndtField: UITextField!
    @IBOutlet weak var previousCertificateField: UITextField!
    @IBOutlet weak var previousExamDateField: UITextField!
    @IBOutlet weak var loadTestCertField: UITextField!
    @IBOutlet weak var loadTestDateField: UITextField!
    @IBOutlet weak var mainWireCertField: UITextField!
    @IBOutlet weak var auxWireCertField: UITextField!
   
    
    @IBOutlet weak var cheatLabel: UILabel!
    
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var serialField: UITextField!
    @IBOutlet weak var fleetField: UITextField!
    @IBOutlet weak var regField: UITextField!
    @IBOutlet weak var swlField: UITextField!
    @IBOutlet weak var counterweightField: UITextField!
    @IBOutlet weak var ballastField: UITextField!
    @IBOutlet weak var maxConfigField: UITextField!
    @IBOutlet weak var currentConfigField: UITextField!
    
    @IBOutlet weak var mainWireField: UITextField!
    @IBOutlet weak var auxWireField: UITextField!
    @IBOutlet weak var trolleyWireField: UITextField!
    
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

    @IBOutlet weak var standardField: UITextField!
    @IBOutlet weak var nextExamDateLabel: UILabel!
    @IBOutlet weak var nextTestDateLabel: UILabel!
    @IBOutlet weak var creepingField: UITextField!
    
    @IBOutlet weak var outcomeField: UITextField!
    
    @IBOutlet weak var satisfactoryButton: UIButton!
    @IBOutlet weak var unsatisfactoryButton: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var mainLinePullLabel: UITextField!
    @IBOutlet weak var auxLinePullLabel: UITextField!
    
    //Reason
    
    var ReasonAnswer = 0
    
    var reasonArray = ["Swipe Up to Select", "A. Within an Interval of 6 Months", "B. Within an Interval of 12 Months", "C. In Accordance with an Examination Schedule", "D. After the Occurance of Exceptional Circumstances", "E. New Installation of Equipment", "F. Reconfiguration of Equipment", "G. New Equipment"]
    
    @IBOutlet weak var reasonPicker: UIPickerView!
    
    @IBAction func reasonSelect(_ sender: AnyObject) {
        if (ReasonAnswer == 0){
            reasonLabel.text = ""
        }else if ReasonAnswer == 1{
            reasonLabel.text = "A"
        }else if ReasonAnswer == 2{
            reasonLabel.text = "B"
        }else if ReasonAnswer == 3{
            reasonLabel.text = "C"
        }else if ReasonAnswer == 4{
            reasonLabel.text = "D"
        }else if ReasonAnswer == 5{
            reasonLabel.text = "E"
        }else if ReasonAnswer == 6{
            reasonLabel.text = "F"
        }else if ReasonAnswer == 7{
            reasonLabel.text = "G"
        }
    }
    //PICKERS
    
    //var
    var ManualAnswer = 0
    var idMarkingsAnswer = 0
    var CabinAnswer = 0
    var FireExtinguisherAnswer = 0
    var VisualAnswer = 0
    var LoadChartAnswer = 0
    var ChassisAnswer = 0
    var SlewingAnswer = 0
    var OutriggerAnswer = 0
    var SparkArrestorAnswer = 0
    var BrakingAnswer = 0
    var HookAnswer = 0
    var TyresAnswer = 0
    var FluidAnswer = 0
    var SuperstructureAnswer = 0
    var HydraulicAnswer = 0
    var ConnectionAnswer = 0
    var WireRopeAnswer = 0
    var CylinderAnswer = 0
    var ControlAnswer = 0
    var EmergencyStopAnswer = 0
    var WiringAnswer = 0
    var OverloadAnswer = 0
    var AnemometerAnswer = 0
    var EarthingAnswer = 0
    var SpeedAnswer = 0
    var LimitSwitchesAnswer = 0
    var BatteriesAnswer = 0
    var TiltingAnswer = 0
    var LightsAnswer = 0
    var FunctionsAnswer = 0
    var EmergencyFunctionsAnswer = 0
    var WorkingHeightAnswer = 0
    var PlatformHeightAnswer = 0
    var TypeAnswer = 0
    var Test1Answer = 0
    var Test2Answer = 0
    var Test3Answer = 0
    var Test4Answer = 0
    var Units1Answer = 0
    var Units2Answer = 0
    var Detail1Answer = 0
    var Detail2Answer = 0
    var Detail3Answer = 0
    var Detail4Answer = 0
    var RadiusAnswer = 0
    var BoomAnswer = 0
    var MaintenanceAnswer = 0
    
    //Labeles for pickers
    
    @IBOutlet weak var radius2Label: UILabel!
    @IBOutlet weak var boomLabel: UILabel!
    
    @IBOutlet weak var manualLabel: UILabel!
    @IBOutlet weak var idMarkingsLabel: UILabel!
    @IBOutlet weak var cabinLabel: UILabel!
    @IBOutlet weak var fireExtinguisherLabel: UILabel!
    @IBOutlet weak var visualLabel: UILabel!
    @IBOutlet weak var loadChartLabel: UILabel!
    @IBOutlet weak var chassisLabel: UILabel!
    @IBOutlet weak var slewingLabel: UILabel!
    @IBOutlet weak var outriggerLabel: UILabel!
    @IBOutlet weak var sparkArrestorLabel: UILabel!
    @IBOutlet weak var brakingLabel: UILabel!
    @IBOutlet weak var hookLabel: UILabel!
    @IBOutlet weak var tyresLabel: UILabel!
    @IBOutlet weak var fluidLabel: UILabel!
    @IBOutlet weak var superstructureLabel: UILabel!
    @IBOutlet weak var hydraulicLabel: UILabel!
    @IBOutlet weak var connectionsLabel: UILabel!
    @IBOutlet weak var wireRopeLabel: UILabel!
    @IBOutlet weak var cylinderLabel: UILabel!
    @IBOutlet weak var controlLabel: UILabel!
    @IBOutlet weak var emergencyStopLabel: UILabel!
    @IBOutlet weak var wiringLabel: UILabel!
    @IBOutlet weak var overloadLabel: UILabel!
    @IBOutlet weak var anemometerLabel: UILabel!
    @IBOutlet weak var earthingLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var limitSwitchesLabel: UILabel!
    @IBOutlet weak var batteriesLabel: UILabel!
    @IBOutlet weak var tiltingLabel: UILabel!
    @IBOutlet weak var lightsLabel: UILabel!
    @IBOutlet weak var functionsLabel: UILabel!
    @IBOutlet weak var emergencyFunctionsLabel: UILabel!
    @IBOutlet weak var workingHeightLabel: UILabel!
    @IBOutlet weak var platformHeightLabel: UILabel!
    @IBOutlet weak var units1Label: UILabel!
    @IBOutlet weak var units2Label: UILabel!
    @IBOutlet weak var detail1Label: UILabel!
    @IBOutlet weak var detail2Label: UILabel!
    @IBOutlet weak var detail3Label: UILabel!
    @IBOutlet weak var detail4Label: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    
    @IBOutlet weak var boomLengthLabel: UITextField!
    @IBOutlet weak var RadiusLabel: UITextField!
    
    //Pickers
    @IBOutlet weak var detail1Picker: UIPickerView!
    @IBOutlet weak var detail2Picker: UIPickerView!
    @IBOutlet weak var detail3Picker: UIPickerView!
    @IBOutlet weak var detail4Picker: UIPickerView!
    @IBOutlet weak var manualPicker: UIPickerView!
    @IBOutlet weak var idMarkingsPicker: UIPickerView!
    @IBOutlet weak var cabinPicker: UIPickerView!
    @IBOutlet weak var fireExtinguisherPicker: UIPickerView!
    @IBOutlet weak var visualPicker: UIPickerView!
    @IBOutlet weak var loadChartPicker: UIPickerView!
    @IBOutlet weak var chassisPicker: UIPickerView!
    @IBOutlet weak var slewingPicker: UIPickerView!
    @IBOutlet weak var outriggerPicker: UIPickerView!
    @IBOutlet weak var sparkArrestorPicker: UIPickerView!
    @IBOutlet weak var brakingPicker: UIPickerView!
    @IBOutlet weak var hookPicker: UIPickerView!
    @IBOutlet weak var tyresPicker: UIPickerView!
    @IBOutlet weak var fluidPicker: UIPickerView!
    @IBOutlet weak var superstructurePicker: UIPickerView!
    @IBOutlet weak var hydraulicPicker: UIPickerView!
    @IBOutlet weak var connectionsPicker: UIPickerView!
    @IBOutlet weak var wireRopePicker: UIPickerView!
    @IBOutlet weak var cylinderPicker: UIPickerView!
    @IBOutlet weak var controlsPicker: UIPickerView!
    @IBOutlet weak var emergencyStopPicker: UIPickerView!
    @IBOutlet weak var wiringPicker: UIPickerView!
    @IBOutlet weak var overloadPicker: UIPickerView!
    @IBOutlet weak var anemometerPicker: UIPickerView!
    @IBOutlet weak var earthingPicker: UIPickerView!
    @IBOutlet weak var speedPicker: UIPickerView!
    @IBOutlet weak var limitSwitchPicker: UIPickerView!
    @IBOutlet weak var batteriesPicker: UIPickerView!
    @IBOutlet weak var tiltingPicker: UIPickerView!
    @IBOutlet weak var lightsPicker: UIPickerView!
    @IBOutlet weak var functionsPicker: UIPickerView!
    @IBOutlet weak var emergencyFunctionsPicker: UIPickerView!
    @IBOutlet weak var workingHeightPicker: UIPickerView!
    @IBOutlet weak var platformHeightPicker: UIPickerView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var test1Picker: UIPickerView!
    @IBOutlet weak var test2Picker: UIPickerView!
    @IBOutlet weak var test3Picker: UIPickerView!
    @IBOutlet weak var test4Picker: UIPickerView!
    @IBOutlet weak var units1Picker: UIPickerView!
    @IBOutlet weak var units2Picker: UIPickerView!
    
    
    @IBOutlet weak var radius2Picker: UIPickerView!
    @IBOutlet weak var boomPicker: UIPickerView!
    
    //Buttons
    
    @IBOutlet weak var reasonButton: UIButton!
    
    @IBOutlet weak var boomSelect: UIButton!
    @IBOutlet weak var radius2Select: UIButton!
    @IBOutlet weak var detail1Button: UIButton!
    @IBOutlet weak var detail2Button: UIButton!
    @IBOutlet weak var detail3Button: UIButton!
    @IBOutlet weak var detail4Button: UIButton!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var manualButton: UIButton!
    @IBOutlet weak var idMarkingsButton: UIButton!
    @IBOutlet weak var cabinButton: UIButton!
    @IBOutlet weak var fireExtinguisherButton: UIButton!
    @IBOutlet weak var visualButton: UIButton!
    @IBOutlet weak var loadChartButton: UIButton!
    @IBOutlet weak var chassisButton: UIButton!
    @IBOutlet weak var slewingButton: UIButton!
    @IBOutlet weak var outriggerButton: UIButton!
    @IBOutlet weak var sparkArrestorButton: UIButton!
    @IBOutlet weak var brakingButton: UIButton!
    @IBOutlet weak var hookButton: UIButton!
    @IBOutlet weak var tyresButton: UIButton!
    @IBOutlet weak var fluidButton: UIButton!
    @IBOutlet weak var superstructureButton: UIButton!
    @IBOutlet weak var hydraulicButton: UIButton!
    @IBOutlet weak var connectionsButton: UIButton!
    @IBOutlet weak var wireRopeButton: UIButton!
    @IBOutlet weak var cylinderButton: UIButton!
    @IBOutlet weak var controlSelect: UIButton!
    @IBOutlet weak var emergencyStopSelect: UIButton!
    @IBOutlet weak var wiringSelect: UIButton!
    @IBOutlet weak var overloadSelect: UIButton!
    @IBOutlet weak var anemometerSelect: UIButton!
    @IBOutlet weak var earthingSelect: UIButton!
    @IBOutlet weak var speedSelect: UIButton!
    @IBOutlet weak var limitSwitchSelect: UIButton!
    @IBOutlet weak var batteriesSelect: UIButton!
    @IBOutlet weak var tiltingSelect: UIButton!
    @IBOutlet weak var lightsSelect: UIButton!
    @IBOutlet weak var functionsSelect: UIButton!
    @IBOutlet weak var emergencyFunctionsSelect: UIButton!
    @IBOutlet weak var workingHeightButton: UIButton!
    @IBOutlet weak var platformHeightButton: UIButton!
    @IBOutlet weak var test1Button: UIButton!
    @IBOutlet weak var test2Button: UIButton!
    @IBOutlet weak var test3Button: UIButton!
    @IBOutlet weak var test4Button: UIButton!
    @IBOutlet weak var units1Button: UIButton!
    @IBOutlet weak var units2Button: UIButton!
    
    @IBOutlet weak var proofLoadPicker: UIPickerView!
    
    @IBOutlet weak var proofLoadButton: UIButton!
    @IBOutlet weak var proofLoadLabel: UILabel!
    

    var allArray = ["Swipe Up to Select","Not Applicable","Satisfactory","Unsatisfactory", "Not Available"]
    
    var maintenanceArray = ["Swipe Up", "Available", "Not Available"]

    var examArray = ["Swipe Up to Select","N/A", "6 Months:  \(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))", "12 Months:  \(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"]
    
    var testArray = ["Swipe Up to Select","N/A", "6 Months:  \(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))", "12 Months:  \(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))","4 Years:  \(DateFormatter.localizedString(from: fouryears!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"]
    
    var workingArray = ["Swipe Up to Select", "Working Height", "Max. Configuration", "Tower Height"]
    
    var platformArray = ["Swipe Up to Select", "Platform Height", "Current Configuration"]
    
    var typeArray = ["Swipe Up to Select", "Thorough Examination", "Test Thorough Examination"]
    
    
    var testInfoArray = ["Swipe Up","1.0", "1.10", "1.25"]
    
    var units1Array = ["Swipe Up", "kg", "tonne", "Ton", "lbs", "kN"]
    
    var units2Array = ["Swipe Up", "mtrs", "ft"]
    
    var detailArray = ["Swipe Up", "Yes", "N/A", "No"]
    
    var radius2Array = ["Swipe Up to Select", "Radius (Min. to Max.)", "Max. Number of Persons", "Fork Length", "Long Travelling Length"]
    
    var boomArray = ["Swipe Up to Select", "Boom Length (Min. to Max.)","Reach", "Mast Height"]

    
    //Weight Labels
    @IBOutlet weak var weight1Label: UILabel!
    @IBOutlet weak var weight2Label: UILabel!
    
    //Length Labels
    @IBOutlet weak var length1Label: UILabel!
    @IBOutlet weak var length2Label: UILabel!

    //Actions
    
    @IBAction func maintenanceSelect(_ sender: AnyObject) {
        if (MaintenanceAnswer == 0){
            maintenanceField.text = ""
        } else if (MaintenanceAnswer == 1){
            maintenanceField.text = "Available"
        }else if (MaintenanceAnswer == 2){
            maintenanceField.text = "Not Available"
        }
        
    }
    
    
    
    @IBAction func proofLoadSelected(_ sender: AnyObject) {
        if (ProofLoadAnswer == 0){
            proofLoadLabel.text = ""
        } else if (ProofLoadAnswer == 1){
            proofLoadLabel.text = "Yes"
        }else if (ProofLoadAnswer == 2){
            proofLoadLabel.text = "N/A"
        }else if (ProofLoadAnswer == 3){
            proofLoadLabel.text = "No"
        }
    }
    
    @IBAction func radius2Selected(_ sender: AnyObject) {
        if (RadiusAnswer == 0){
            radius2Label.text = ""
        } else if (RadiusAnswer == 1){
            radius2Label.text = " Radius (Min. to Max.):"
        }else if (RadiusAnswer == 2){
            radius2Label.text = " Max. Number of Persons:"
        }else if (RadiusAnswer == 3){
            radius2Label.text = " Fork Length:"
        }else if (RadiusAnswer == 4){
            radius2Label.text = " Long Travelling Length:"
        }
    }
    
    @IBAction func boomSelected(_ sender: AnyObject) {
        if (BoomAnswer == 0){
            boomLabel.text = ""
        } else if (BoomAnswer == 1){
            boomLabel.text = " Boom Length (Min. to Max.):"
        }else if (BoomAnswer == 2){
            boomLabel.text = " Reach:"
        }else if (BoomAnswer == 3){
            boomLabel.text = " Mast Height:"
        }else if (BoomAnswer == 4){
            boomLabel.text = " Long Travelling Length:"
        }
    }
    
    
    @IBAction func detail1Select(_ sender: AnyObject) {
        if (Detail1Answer == 0){
            detail1Label.text = ""
        } else if (Detail1Answer == 1){
            detail1Label.text = "Yes"
        }else if (Detail1Answer == 2){
            detail1Label.text = "N/A"
        }else if (Detail1Answer == 3){
            detail1Label.text = "No"
        }
    }
    @IBAction func detail2Select(_ sender: AnyObject) {
        if (Detail2Answer == 0){
            detail2Label.text = ""
        } else if (Detail2Answer == 1){
            detail2Label.text = "Yes"
        }else if (Detail2Answer == 2){
            detail2Label.text = "N/A"
        }else if (Detail2Answer == 3){
            detail2Label.text = "No"
        }
    }
    @IBAction func detail3Select(_ sender: AnyObject) {
        if (Detail3Answer == 0){
            detail3Label.text = ""
        } else if (Detail3Answer == 1){
            detail3Label.text = "Yes"
        }else if (Detail3Answer == 2){
            detail3Label.text = "N/A"
        }else if (Detail3Answer == 3){
            detail3Label.text = "No"
        }
    }
    @IBAction func detail4Select(_ sender: AnyObject) {
        if (Detail4Answer == 0){
            detail4Label.text = ""
        } else if (Detail4Answer == 1){
            detail4Label.text = "Yes"
        }else if (Detail4Answer == 2){
            detail4Label.text = "N/A"
        }else if (Detail4Answer == 3){
            detail4Label.text = "No"
        }
    }
    
    @IBAction func units1Select(_ sender: AnyObject) {
        if (Units1Answer == 0){
        } else if (Units1Answer == 1){
            units1Label.text = "(kg)"
            weight1Label.text = units1Label.text
            weight2Label.text = units1Label.text
        }else if (Units1Answer == 2){
            units1Label.text = "(tonne)"
            weight1Label.text = units1Label.text
            weight2Label.text = units1Label.text
        }else if (Units1Answer == 3){
            units1Label.text = "(Ton)"
            weight1Label.text = units1Label.text
            weight2Label.text = units1Label.text
        }else if (Units1Answer == 4){
            units1Label.text = "(lbs)"
            weight1Label.text = units1Label.text
            weight2Label.text = units1Label.text
        }else if (Units1Answer == 5){
            units1Label.text = "(kN)"
            weight1Label.text = units1Label.text
            weight2Label.text = units1Label.text
        }
    }
    
    @IBAction func units2Select(_ sender: AnyObject) {
        if (Units2Answer == 0){
        } else if (Units2Answer == 1){
            units2Label.text = "(mtrs)"
            length1Label.text = units2Label.text
            length2Label.text = units2Label.text
        }else if (Units2Answer == 2){
            units2Label.text = "(ft)"
            length1Label.text = units2Label.text
            length2Label.text = units2Label.text
        }
    }
    
    
    @IBAction func typeSelect(_ sender: AnyObject) {
        if (TypeAnswer == 0){
            typeField.text = ""
        } else if (TypeAnswer == 1){
           typeField.text = "Thorough Examination"
        }else if (TypeAnswer == 2){
            typeField.text = "Test & Thorough Examination"
        }
        
    }
    @IBAction func test1Select(_ sender: AnyObject) {
        if (Test1Answer == 0){
            
        } else if(Test1Answer == 1){
            appliedLoad1Field.text? = "\(swl1Field.text!)"
        }else if(Test1Answer == 2){
            let number1 = Double(swl1Field.text!) ?? 0
            let number2 = Double(test1Label.text!) ?? 0
                appliedLoad1Field.text? = "\(number1 * number2)"
        }else if(Test1Answer == 3){
            let number1 = Double(swl1Field.text!) ?? 0
            let number2 = Double(test1Label.text!) ?? 0
                appliedLoad1Field.text? = "\(number1 * number2)"
        }
    }
    @IBOutlet weak var test1Label: UILabel!
    @IBOutlet weak var test2Label: UILabel!
    @IBOutlet weak var test3Label: UILabel!
    @IBOutlet weak var test4Label: UILabel!
    
    @IBAction func test2Select(_ sender: AnyObject) {
        if (Test2Answer == 0){
            
        } else if(Test2Answer == 1){
            appliedLoad2Field.text? = "\(swl2Field.text!)"
        }else if(Test2Answer == 2){
            let number1 = Double(swl2Field.text!) ?? 0
            let number2 = Double(test2Label.text!) ?? 0
            appliedLoad2Field.text? = "\(number1 * number2)"
            
        }else if(Test2Answer == 3){
            let number1 = Double(swl2Field.text!) ?? 0
            let number2 = Double(test2Label.text!) ?? 0
                appliedLoad2Field.text? = "\(number1 * number2)"
        }
    }
    @IBAction func test3Select(_ sender: AnyObject) {
        if (Test3Answer == 0){
            
        } else if(Test3Answer == 1){
            appliedLoad3Field.text? = "\(swl3Field.text!)"
        }else if(Test3Answer == 2){
            let number1 = Double(swl3Field.text!) ?? 0
            let number2 = Double(test3Label.text!) ?? 0
                appliedLoad3Field.text? = "\(number1 * number2)"
        }else if(Test3Answer == 3){
            let number1 = Double(swl3Field.text!) ?? 0
            let number2 = Double(test3Label.text!) ?? 0
                appliedLoad3Field.text? = "\(number1 * number2)"
        }
    }
    @IBAction func test4Select(_ sender: AnyObject) {
        if (Test4Answer == 0){
            
        } else if(Test4Answer == 1){
            appliedLoad4Field.text? = "\(swl4Field.text!)"
        }else if(Test4Answer == 2){
            let number1 = Double(swl4Field.text!) ?? 0
            let number2 = Double(test4Label.text!) ?? 0

            appliedLoad4Field.text? = "\(number1 * number2)"
        }else if(Test4Answer == 3){
            let number1 = Double(swl4Field.text!) ?? 0
            let number2 = Double(test4Label.text!) ?? 0
                appliedLoad4Field.text? = "\(number1 * number2)"
        }
    }
    
    @IBAction func workingSelect(_ sender: AnyObject) {
        if (WorkingHeightAnswer == 0){
            workingHeightLabel.text = ""
        } else if (WorkingHeightAnswer == 1){
            workingHeightLabel.text = "Working Height:"
        } else if (WorkingHeightAnswer == 2){
            workingHeightLabel.text = "Max. Configuration:"
        }else if (WorkingHeightAnswer == 3){
            workingHeightLabel.text = "Tower Height:"
        }
    }
    @IBAction func platformSelect(_ sender: AnyObject) {
        if (PlatformHeightAnswer == 0){
            platformHeightLabel.text = ""
        } else if (PlatformHeightAnswer == 1){
            platformHeightLabel.text = "Platform Height:"
        }else if (PlatformHeightAnswer == 2){
            platformHeightLabel.text = "Current Configuration:"
        }
    }
    
    @IBAction func manualSelect(_ sender: AnyObject) {
        if (ManualAnswer == 0){
            manualLabel.text = ""
        }
        else if(ManualAnswer == 1){
            manualLabel.text = "Not Applicable"
        }
        else if(ManualAnswer == 2){
            manualLabel.text = "Satisfactory"
        }
        else if(ManualAnswer == 3){
            manualLabel.text = "Unsatisfactory"
        } else if(ManualAnswer == 4){
            
            manualLabel.text = "Not Available"
        }
    }
    @IBAction func idMarkingsButton(_ sender: AnyObject) {
        if (idMarkingsAnswer == 0){
            idMarkingsLabel.text = ""
        }
        else if(idMarkingsAnswer == 1){
            idMarkingsLabel.text = "Not Applicable"
        }
        else if(idMarkingsAnswer == 2){
            idMarkingsLabel.text = "Satisfactory"
        }
        else if(idMarkingsAnswer == 3){
            idMarkingsLabel.text = "Unsatisfactory"
        } else if(idMarkingsAnswer == 4){
            
            idMarkingsLabel.text = "Not Available"
        }
    }
    @IBAction func cabinSelect(_ sender: AnyObject) {
        if (CabinAnswer == 0){
            cabinLabel.text = ""
        }
        else if(CabinAnswer == 1){
            cabinLabel.text = "Not Applicable"
        }
        else if(CabinAnswer == 2){
            cabinLabel.text = "Satisfactory"
        }
        else if(CabinAnswer == 3){
            cabinLabel.text = "Unsatisfactory"
        } else if(CabinAnswer == 4){
            cabinLabel.text = "Not Available"
        }
    }
    @IBAction func fireExtinguisherSelect(_ sender: AnyObject) {
        if (FireExtinguisherAnswer == 0){
            fireExtinguisherLabel.text = ""
        }
        else if(FireExtinguisherAnswer == 1){
            fireExtinguisherLabel.text = "Not Applicable"
        }
        else if(FireExtinguisherAnswer == 2){
            fireExtinguisherLabel.text = "Satisfactory"
        }
        else if(FireExtinguisherAnswer == 3){
            fireExtinguisherLabel.text = "Unsatisfactory"
        } else if(FireExtinguisherAnswer == 4){
            fireExtinguisherLabel.text = "Not Available"
        }
    }
    @IBAction func visualSelect(_ sender: AnyObject) {
        if (VisualAnswer == 0){
            visualLabel.text = ""
        }
        else if(VisualAnswer == 1){
            visualLabel.text = "Not Applicable"
        }
        else if(VisualAnswer == 2){
            visualLabel.text = "Satisfactory"
        }
        else if(VisualAnswer == 3){
            visualLabel.text = "Unsatisfactory"
        } else if(VisualAnswer == 4){
            visualLabel.text = "Not Available"
        }
    }
    @IBAction func loadChartSelect(_ sender: AnyObject) {
        if (LoadChartAnswer == 0){
            loadChartLabel.text = ""
        }
        else if(LoadChartAnswer == 1){
            loadChartLabel.text = "Not Applicable"
        }
        else if(LoadChartAnswer == 2){
            loadChartLabel.text = "Satisfactory"
        }
        else if(LoadChartAnswer == 3){
            loadChartLabel.text = "Unsatisfactory"
        } else if(LoadChartAnswer == 4){
            loadChartLabel.text = "Not Available"
        }
    }
    
    @IBAction func chassisSelect(_ sender: AnyObject) {
        if (ChassisAnswer == 0){
            chassisLabel.text = ""
        }
        else if(ChassisAnswer == 1){
            chassisLabel.text = "Not Applicable"
        }
        else if(ChassisAnswer == 2){
            chassisLabel.text = "Satisfactory"
        }
        else if(ChassisAnswer == 3){
            chassisLabel.text = "Unsatisfactory"
        } else if(ChassisAnswer == 4){
            chassisLabel.text = "Not Available"
        }
    }
    @IBAction func slewingSelect(_ sender: AnyObject) {
        if (SlewingAnswer == 0){
            slewingLabel.text = ""
        }
        else if(SlewingAnswer == 1){
            slewingLabel.text = "Not Applicable"
        }
        else if(SlewingAnswer == 2){
            slewingLabel.text = "Satisfactory"
        }
        else if(SlewingAnswer == 3){
            slewingLabel.text = "Unsatisfactory"
        } else if(SlewingAnswer == 4){
            slewingLabel.text = "Not Available"
        }
    }
    @IBAction func outriggerSelect(_ sender: AnyObject) {
        if (OutriggerAnswer == 0){
            outriggerLabel.text = ""
        }
        else if(OutriggerAnswer == 1){
            outriggerLabel.text = "Not Applicable"
        }
        else if(OutriggerAnswer == 2){
            outriggerLabel.text = "Satisfactory"
        }
        else if(OutriggerAnswer == 3){
            outriggerLabel.text = "Unsatisfactory"
        } else if(OutriggerAnswer == 4){
            outriggerLabel.text = "Not Available"
        }
    }
    @IBAction func sparkArrestorSelect(_ sender: AnyObject) {
        if (SparkArrestorAnswer == 0){
            sparkArrestorLabel.text = ""
        }
        else if(SparkArrestorAnswer == 1){
            sparkArrestorLabel.text = "Not Applicable"
        }
        else if(SparkArrestorAnswer == 2){
            sparkArrestorLabel.text = "Satisfactory"
        }
        else if(SparkArrestorAnswer == 3){
            sparkArrestorLabel.text = "Unsatisfactory"
        } else if(SparkArrestorAnswer == 4){
            sparkArrestorLabel.text = "Not Available"
        }
    }
    @IBAction func brakingSelect(_ sender: AnyObject) {
        if (BrakingAnswer == 0){
            brakingLabel.text = ""
        }
        else if(BrakingAnswer == 1){
            brakingLabel.text = "Not Applicable"
        }
        else if(BrakingAnswer == 2){
            brakingLabel.text = "Satisfactory"
        }
        else if(BrakingAnswer == 3){
            brakingLabel.text = "Unsatisfactory"
        } else if(BrakingAnswer == 4){
            brakingLabel.text = "Not Available"
        }
    }
    @IBAction func hookSelect(_ sender: AnyObject) {
        if (HookAnswer == 0){
            hookLabel.text = ""
        }
        else if(HookAnswer == 1){
            hookLabel.text = "Not Applicable"
        }
        else if(HookAnswer == 2){
            hookLabel.text = "Satisfactory"
        }
        else if(HookAnswer == 3){
            hookLabel.text = "Unsatisfactory"
        } else if(HookAnswer == 4){
            hookLabel.text = "Not Available"
        }
    }
    @IBAction func tyresSelect(_ sender: AnyObject) {
        if (TyresAnswer == 0){
            tyresLabel.text = ""
        }
        else if(TyresAnswer == 1){
           tyresLabel.text = "Not Applicable"
        }
        else if(TyresAnswer == 2){
            tyresLabel.text = "Satisfactory"
        }
        else if(TyresAnswer == 3){
            tyresLabel.text = "Unsatisfactory"
        } else if(TyresAnswer == 4){
            tyresLabel.text = "Not Available"
        }
    }
    @IBAction func fluidSelect(_ sender: AnyObject) {
        if (FluidAnswer == 0){
            fluidLabel.text = ""
        }
        else if(FluidAnswer == 1){
            fluidLabel.text = "Not Applicable"
        }
        else if(FluidAnswer == 2){
            fluidLabel.text = "Satisfactory"
        }
        else if(FluidAnswer == 3){
            fluidLabel.text = "Unsatisfactory"
        } else if(FluidAnswer == 4){
            fluidLabel.text = "Not Available"
        }
    }
    
    @IBAction func superstructureSelect(_ sender: AnyObject) {
        if (SuperstructureAnswer == 0){
            superstructureLabel.text = ""
        }
        else if(SuperstructureAnswer == 1){
            superstructureLabel.text = "Not Applicable"
        }
        else if(SuperstructureAnswer == 2){
            superstructureLabel.text = "Satisfactory"
        }
        else if(SuperstructureAnswer == 3){
            superstructureLabel.text = "Unsatisfactory"
        } else if(SuperstructureAnswer == 4){
            superstructureLabel.text = "Not Available"
        }
    }

    @IBAction func hydraulicSelect(_ sender: AnyObject) {
        if (HydraulicAnswer == 0){
            hydraulicLabel.text = ""
        }
        else if(HydraulicAnswer == 1){
            hydraulicLabel.text = "Not Applicable"
        }
        else if(HydraulicAnswer == 2){
            hydraulicLabel.text = "Satisfactory"
        }
        else if(HydraulicAnswer == 3){
            hydraulicLabel.text = "Unsatisfactory"
        } else if(HydraulicAnswer == 4){
            hydraulicLabel.text = "Not Available"
        }
    }

    @IBAction func connectionSelect(_ sender: AnyObject) {
        if (ConnectionAnswer == 0){
            connectionsLabel.text = ""
        }
        else if(ConnectionAnswer == 1){
            connectionsLabel.text = "Not Applicable"
        }
        else if(ConnectionAnswer == 2){
            connectionsLabel.text = "Satisfactory"
        }
        else if(ConnectionAnswer == 3){
            connectionsLabel.text = "Unsatisfactory"
        } else if(ConnectionAnswer == 4){
            connectionsLabel.text = "Not Available"
        }
    }
    @IBAction func wireRopeSelect(_ sender: AnyObject) {
        if (WireRopeAnswer == 0){
            wireRopeLabel.text = ""
        }
        else if(WireRopeAnswer == 1){
            wireRopeLabel.text = "Not Applicable"
        }
        else if(WireRopeAnswer == 2){
            wireRopeLabel.text = "Satisfactory"
        }
        else if(WireRopeAnswer == 3){
            wireRopeLabel.text = "Unsatisfactory"
        } else if(WireRopeAnswer == 4){
            wireRopeLabel.text = "Not Available"
        }
    }
    @IBAction func cylinderSelect(_ sender: AnyObject) {
        if (CylinderAnswer == 0){
            cylinderLabel.text = ""
        }
        else if(CylinderAnswer == 1){
            cylinderLabel.text = "Not Applicable"
        }
        else if(CylinderAnswer == 2){
            cylinderLabel.text = "Satisfactory"
        }
        else if(CylinderAnswer == 3){
            cylinderLabel.text = "Unsatisfactory"
        } else if(CylinderAnswer == 4){
            cylinderLabel.text = "Not Available"
        }
    }
    @IBAction func controlSelect(_ sender: AnyObject) {
        if (ControlAnswer == 0){
            controlLabel.text = ""
        }
        else if(ControlAnswer == 1){
            controlLabel.text = "Not Applicable"
        }
        else if(ControlAnswer == 2){
            controlLabel.text = "Satisfactory"
        }
        else if(ControlAnswer == 3){
            controlLabel.text = "Unsatisfactory"
        } else if(ControlAnswer == 4){
            controlLabel.text = "Not Available"
        }
    }
    @IBAction func emergencyStopSelect(_ sender: AnyObject) {
        if (EmergencyStopAnswer == 0){
            emergencyStopLabel.text = ""
        }
        else if(EmergencyStopAnswer == 1){
            emergencyStopLabel.text = "Not Applicable"
        }
        else if(EmergencyStopAnswer == 2){
            emergencyStopLabel.text = "Satisfactory"
        }
        else if(EmergencyStopAnswer == 3){
            emergencyStopLabel.text = "Unsatisfactory"
        } else if(EmergencyStopAnswer == 4){
            emergencyStopLabel.text = "Not Available"
        }
    }
    @IBAction func wiringSelect(_ sender: AnyObject) {
        if (WiringAnswer == 0){
            wiringLabel.text = ""
        }
        else if(WiringAnswer == 1){
            wiringLabel.text = "Not Applicable"
        }
        else if(WiringAnswer == 2){
            wiringLabel.text = "Satisfactory"
        }
        else if(WiringAnswer == 3){
            wiringLabel.text = "Unsatisfactory"
        } else if(WiringAnswer == 4){
            wiringLabel.text = "Not Available"
        }
    }
    @IBAction func overloadSelect(_ sender: AnyObject) {
        if (OverloadAnswer == 0){
            overloadLabel.text = ""
        }
        else if(OverloadAnswer == 1){
            overloadLabel.text = "Not Applicable"
        }
        else if(OverloadAnswer == 2){
            overloadLabel.text = "Satisfactory"
        }
        else if(OverloadAnswer == 3){
            overloadLabel.text = "Unsatisfactory"
        } else if(OverloadAnswer == 4){
            overloadLabel.text = "Not Available"
        }
    }
    @IBAction func anemometerSelect(_ sender: AnyObject) {
        if (AnemometerAnswer == 0){
            anemometerLabel.text = ""
        }
        else if(AnemometerAnswer == 1){
            anemometerLabel.text = "Not Applicable"
        }
        else if(AnemometerAnswer == 2){
            anemometerLabel.text = "Satisfactory"
        }
        else if(AnemometerAnswer == 3){
            anemometerLabel.text = "Unsatisfactory"
        } else if(AnemometerAnswer == 4){
            anemometerLabel.text = "Not Available"
        }
    }
    @IBAction func earthingSelect(_ sender: AnyObject) {
        if (EarthingAnswer == 0){
            earthingLabel.text = ""
        }
        else if(EarthingAnswer == 1){
            earthingLabel.text = "Not Applicable"
        }
        else if(EarthingAnswer == 2){
            earthingLabel.text = "Satisfactory"
        }
        else if(EarthingAnswer == 3){
            earthingLabel.text = "Unsatisfactory"
        } else if(EarthingAnswer == 4){
            earthingLabel.text = "Not Available"
        }
    }
    @IBAction func speedSelect(_ sender: AnyObject) {
        if (SpeedAnswer == 0){
            speedLabel.text = ""
        }
        else if(SpeedAnswer == 1){
            speedLabel.text = "Not Applicable"
        }
        else if(SpeedAnswer == 2){
            speedLabel.text = "Satisfactory"
        }
        else if(SpeedAnswer == 3){
            speedLabel.text = "Unsatisfactory"
        } else if(SpeedAnswer == 4){
            speedLabel.text = "Not Available"
        }
    }
    @IBAction func limitSwitchSelect(_ sender: AnyObject) {
        if (LimitSwitchesAnswer == 0){
            limitSwitchesLabel.text = ""
        }
        else if(LimitSwitchesAnswer == 1){
            limitSwitchesLabel.text = "Not Applicable"
        }
        else if(LimitSwitchesAnswer == 2){
            limitSwitchesLabel.text = "Satisfactory"
        }
        else if(LimitSwitchesAnswer == 3){
            limitSwitchesLabel.text = "Unsatisfactory"
        } else if(LimitSwitchesAnswer == 4){
            limitSwitchesLabel.text = "Not Available"
        }
    }
    @IBAction func batteriesSelect(_ sender: AnyObject) {
        if (BatteriesAnswer == 0){
            batteriesLabel.text = ""
        }
        else if(BatteriesAnswer == 1){
            batteriesLabel.text = "Not Applicable"
        }
        else if(BatteriesAnswer == 2){
            batteriesLabel.text = "Satisfactory"
        }
        else if(BatteriesAnswer == 3){
            batteriesLabel.text = "Unsatisfactory"
        } else if(BatteriesAnswer == 4){
            batteriesLabel.text = "Not Available"
        }
    }
    @IBAction func tiltingSelect(_ sender: AnyObject) {
        if (TiltingAnswer == 0){
            tiltingLabel.text = ""
        }
        else if(TiltingAnswer == 1){
            tiltingLabel.text = "Not Applicable"
        }
        else if(TiltingAnswer == 2){
            tiltingLabel.text = "Satisfactory"
        }
        else if(TiltingAnswer == 3){
            tiltingLabel.text = "Unsatisfactory"
        } else if(TiltingAnswer == 4){
            tiltingLabel.text = "Not Available"
        }
    }
    @IBAction func lightsSelect(_ sender: AnyObject) {
        if (LightsAnswer == 0){
            lightsLabel.text = ""
        }
        else if(LightsAnswer == 1){
            lightsLabel.text = "Not Applicable"
        }
        else if(LightsAnswer == 2){
            lightsLabel.text = "Satisfactory"
        }
        else if(LightsAnswer == 3){
            lightsLabel.text = "Unsatisfactory"
        } else if(LightsAnswer == 4){
            lightsLabel.text = "Not Available"
        }
    }
    @IBAction func functionsSelect(_ sender: AnyObject) {
        if (FunctionsAnswer == 0){
            functionsLabel.text = ""
        }
        else if(FunctionsAnswer == 1){
            functionsLabel.text = "Not Applicable"
        }
        else if(FunctionsAnswer == 2){
            functionsLabel.text = "Satisfactory"
        }
        else if(FunctionsAnswer == 3){
            functionsLabel.text = "Unsatisfactory"
        } else if(FunctionsAnswer == 4){
            functionsLabel.text = "Not Available"
        }
    }
    @IBAction func emergencyFunctionsSelect(_ sender: AnyObject) {
        if (EmergencyFunctionsAnswer == 0){
            emergencyFunctionsLabel.text = ""
        }
        else if(EmergencyFunctionsAnswer == 1){
            emergencyFunctionsLabel.text = "Not Applicable"
        }
        else if(EmergencyFunctionsAnswer == 2){
            emergencyFunctionsLabel.text = "Satisfactory"
        }
        else if(EmergencyFunctionsAnswer == 3){
            emergencyFunctionsLabel.text = "Unsatisfactory"
        } else if(EmergencyFunctionsAnswer == 4){
            emergencyFunctionsLabel.text = "Not Available"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maintenancePicker.dataSource = self
        maintenancePicker.delegate = self
        proofLoadPicker.delegate = self
        proofLoadPicker.dataSource = self
        radius2Picker.delegate = self
        radius2Picker.dataSource = self
        boomPicker.delegate = self
        boomPicker.dataSource = self
        reasonPicker.delegate = self
        reasonPicker.dataSource = self
        detail1Picker.delegate = self
        detail1Picker.dataSource = self
        detail2Picker.delegate = self
        detail2Picker.dataSource = self
        detail3Picker.delegate = self
        detail3Picker.dataSource = self
        detail4Picker.delegate = self
        detail4Picker.dataSource = self
        units1Picker.delegate = self
        units1Picker.dataSource = self
        units2Picker.delegate = self
        units2Picker.dataSource = self
        test1Picker.delegate = self
        test1Picker.dataSource = self
        test2Picker.delegate = self
        test2Picker.dataSource = self
        test3Picker.delegate = self
        test3Picker.dataSource = self
        test4Picker.delegate = self
        test4Picker.dataSource = self
        typePicker.delegate = self
        typePicker.dataSource = self
        workingHeightPicker.delegate = self
        workingHeightPicker.dataSource = self
        platformHeightPicker.delegate = self
        platformHeightPicker.dataSource = self
        examPicker.delegate = self
        examPicker.dataSource = self
        testPicker.delegate = self
        testPicker.dataSource = self
        manualPicker.delegate = self
        manualPicker.dataSource = self
        idMarkingsPicker.delegate = self
        idMarkingsPicker.dataSource = self
        cabinPicker.delegate = self
        cabinPicker.dataSource = self
        fireExtinguisherPicker.delegate = self
        fireExtinguisherPicker.dataSource = self
        visualPicker.delegate = self
        visualPicker.dataSource = self
        loadChartPicker.delegate = self
        loadChartPicker.dataSource = self
        chassisPicker.delegate = self
        chassisPicker.dataSource = self
        slewingPicker.delegate = self
        slewingPicker.dataSource = self
        outriggerPicker.delegate = self
        outriggerPicker.dataSource = self
        sparkArrestorPicker.delegate = self
        sparkArrestorPicker.dataSource = self
        brakingPicker.delegate = self
        brakingPicker.dataSource = self
        wireRopePicker.delegate = self
        wireRopePicker.dataSource = self
        hookPicker.delegate = self
        hookPicker.dataSource = self
        tyresPicker.delegate = self
        tyresPicker.dataSource = self
        fluidPicker.delegate = self
        fluidPicker.dataSource = self
        superstructurePicker.delegate = self
        superstructurePicker.dataSource = self
        hydraulicPicker.delegate = self
        hydraulicPicker.dataSource = self
        connectionsPicker.delegate = self
        connectionsPicker.dataSource = self
        cylinderPicker.delegate = self
        cylinderPicker.dataSource = self
        controlsPicker.delegate = self
        controlsPicker.dataSource = self
        emergencyStopPicker.delegate = self
        emergencyStopPicker.dataSource = self
        wiringPicker.delegate = self
        wiringPicker.dataSource = self
        anemometerPicker.delegate = self
        anemometerPicker.dataSource = self
        earthingPicker.delegate = self
        earthingPicker.dataSource = self
        speedPicker.delegate = self
        speedPicker.dataSource = self
        limitSwitchPicker.delegate = self
        limitSwitchPicker.dataSource = self
        batteriesPicker.delegate = self
        batteriesPicker.dataSource = self
        tiltingPicker.delegate = self
        tiltingPicker.dataSource = self
        lightsPicker.delegate = self
        lightsPicker.dataSource = self
        functionsPicker.delegate = self
        functionsPicker.dataSource = self
        emergencyFunctionsPicker.delegate = self
        emergencyFunctionsPicker.dataSource = self
        overloadPicker.delegate = self
        overloadPicker.dataSource = self
        
        if inspection != nil {
            radius2Label.text = inspection?.radius
            boomLabel.text = inspection?.boom
            mainLinePullLabel.text = inspection?.mainlinepull
            auxLinePullLabel.text = inspection?.auxlinepull
            defectsText.text = inspection?.comment2
            recommendationsText.text = inspection?.comment3
            boomLengthLabel.text = inspection?.comment4
            RadiusLabel.text = inspection?.comment5
            detail1Label.text = inspection?.detail1
            detail2Label.text = inspection?.detail2
            detail3Label.text = inspection?.detail3
            detail4Label.text = inspection?.detail4
            date1Field.text = inspection?.date1
            weight1Label.text = inspection?.swl0
            weight2Label.text = inspection?.appliedload0
            length1Label.text = inspection?.boomlength0
            length2Label.text = inspection?.radius0
            units1Label.text = inspection?.weight
            units2Label.text = inspection?.length
            workingHeightLabel.text = inspection?.working
            platformHeightLabel.text = inspection?.platform
            clientField.text = inspection?.client
            typeField.text = inspection?.type
            nameField.text = inspection?.name
            locationField.text = inspection?.location
            dateField.text = inspection?.date
            timesheetField.text = inspection?.timesheet
            maintenanceField.text = inspection?.maintenance
            ndtField.text = inspection?.ndt
            previousCertificateField.text = inspection?.previouscertificate
            previousExamDateField.text = inspection?.previousexamdate
            loadTestCertField.text = inspection?.loadtestcert
            loadTestDateField.text = inspection?.loadtestdate
            mainWireCertField.text = inspection?.mainwirecert
            auxWireCertField.text = inspection?.auxwirecert
            descriptionField.text = inspection?.descriptioncell
            makeField.text = inspection?.make
            modelField.text = inspection?.model
            serialField.text = inspection?.serial
            fleetField.text = inspection?.fleet
            regField.text = inspection?.reg
            swlField.text = inspection?.swl
            counterweightField.text = inspection?.counterweight
            ballastField.text = inspection?.ballast
            maxConfigField.text = inspection?.maxconfig
            currentConfigField.text = inspection?.currentconfig
            chassisLabel.text = inspection?.chassis
            tyresLabel.text = inspection?.tyre
            slewingLabel.text = inspection?.slewing
            fluidLabel.text = inspection?.fluid
            outriggerLabel.text = inspection?.outrigger
            superstructureLabel.text = inspection?.superstructure
            sparkArrestorLabel.text = inspection?.sparkarrestor
            hydraulicLabel.text = inspection?.leakage
            brakingLabel.text = inspection?.braking
            connectionsLabel.text = inspection?.connections
            mainWireField.text = inspection?.mainwire
            auxWireField.text = inspection?.auxwire
            trolleyWireField.text = inspection?.trolleywire
            wireRopeLabel.text = inspection?.wirerope
            hookLabel.text = inspection?.hook
            cylinderLabel.text = inspection?.cylinder
            controlLabel.text = inspection?.control
            speedLabel.text = inspection?.speed
            emergencyStopLabel.text = inspection?.emergencystop
            limitSwitchesLabel.text = inspection?.limitswitch
            wiringLabel.text = inspection?.wiring
            batteriesLabel.text = inspection?.batteries
            overloadLabel.text = inspection?.overload
            tiltingLabel.text = inspection?.tilting
            anemometerLabel.text = inspection?.anemometer
            lightsLabel.text = inspection?.lights
            earthingLabel.text = inspection?.earthing
            functionsLabel.text = inspection?.functions
            emergencyFunctionsLabel.text = inspection?.emergencyfunctions
            swl1Field.text = inspection?.swl1
            swl2Field.text = inspection?.swl2
            swl3Field.text = inspection?.swl3
            swl4Field.text = inspection?.swl4
            appliedLoad1Field.text = inspection?.appliedload1
            appliedLoad2Field.text = inspection?.appliedload2
            appliedLoad3Field.text = inspection?.appliedload3
            appliedLoad4Field.text = inspection?.appliedload4
            boomLength1Field.text = inspection?.boomlength1
            boomLength2Field.text = inspection?.boomlength2
            boomLength3Field.text = inspection?.boomlength3
            boomLength4Field.text = inspection?.boomlength4
            radius1Field.text = inspection?.radius1
            radius2Field.text = inspection?.radius2
            radius3Field.text = inspection?.radius3
            radius4Field.text = inspection?.radius4
            testInfoField.text = inspection?.testinfo
            fireExtinguisherLabel.text = inspection?.fireextinguisher
            manualLabel.text = inspection?.manual
            reasonLabel.text = inspection?.comment1
            idMarkingsLabel.text = inspection?.idmarkings
            visualLabel.text = inspection?.visual
            outcomeField.text = inspection?.outcome
            standardField.text = inspection?.standard
            loadChartLabel.text = inspection?.loadchart
            cabinLabel.text = inspection?.cabincondition
            creepingField.text = inspection?.creeping
            typeField.text = inspection?.type
            date1Field.text = inspection?.date1
            nextTestDateLabel.text = inspection?.nexttestdate
            nextExamDateLabel.text = inspection?.nextexamdate
            
        }
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        cheat1Label.text = done1
        cheatLabel.text = done
        if cheat1Label.text == "done"{
            standardField.text = STANDARD
        }
        
        
        if cheatLabel.text == "done" {
        makeField.text = make
        modelField.text = model
        swlField.text = swlSelected
        descriptionField.text = desc
        maxConfigField.text = wh
        currentConfigField.text = ph
        boomLengthLabel.text = reach
            
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 9
    }

    let numberOfRowsAtSection: [Int] = [13, 9, 6, 15, 13, 10, 3, 2, 3]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows: Int = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }
    
    
    //Actions
    @IBAction func saveTapped(_ sender: AnyObject) {
    
        
        if inspection != nil {
            
            editItem()
            
        } else {
            
            createNewItem() }
    }

    @IBAction func satisfactoryTapped(_ sender: AnyObject) {
        
        setString()

        if inspection != nil {
        editItem()
        
        } else {
    
            createNewItem() }
    }
    
    @IBAction func cancelTapped(_ sender: AnyObject) {
        dismissVC()
        
        make = ""
        model = ""
        desc = ""
        swlSelected = ""
        ph = ""
        wh = ""
        reach = ""
        done = ""
        done1 = ""
        
        if inspection != nil {
            editItem()
            
        } else {
            
            createNewItem() }
    }


    @IBAction func unsatisfactoryTapped(_ sender: AnyObject) {
    
        setString()

        if inspection != nil {
            editItem()
            
        } else {
            
            createNewItem() }
    }

    @IBAction func datesButtonPressed(_ sender: AnyObject) {
        if inspection != nil {
            editItem()
            
        } else {
            
            createNewItem() }
    }

//Functions
    
    func setString(){
        
        if date1Field.text != nil{
            DATE = date1Field.text!
        } else{
            DATE = ""
        }
        
        if proofLoadLabel.text != nil{
            reach1 = proofLoadLabel.text
        } else{
            reach1 = ""
        }
        
        if radius2Label.text != nil{
            radiusString = radius2Label.text!
        } else{
            radiusString = ""
        }
        if boomLabel.text != nil{
            boom1 = boomLabel.text!
        } else{
            boom1 = ""
        }
        
        //boomlength
        if boomLengthLabel.text != nil{
            boomlength1 = boomLengthLabel.text!
        } else {
            boomlength1 = ""
        }
        
        //radius
        if RadiusLabel.text != nil{
            radius1 = RadiusLabel.text!
        } else {
            radius1 = ""
        }
        
        //defects
        if defectsText.text != nil{
            defects1 = defectsText.text!
        } else{
            defects1 = ""
        }
        //recommendations
        if recommendationsText.text != nil{
            recommendations1 = recommendationsText.text!
        } else{
            recommendations1 = ""
        }
        
        //Reason
        if (reasonLabel.text != nil ){
            reason1 = reasonLabel.text!
        } else {
            reason1 = ""
        }
        
        //detail1
        if detail1Label.text != nil{
            detail1 = detail1Label.text!
        } else{
            detail1 = ""
        }
        //detail2
        if detail1Label.text != nil{
            detail2 = detail2Label.text!
        } else{
            detail2 = ""
        }
        //detail3
        if detail3Label.text != nil{
            detail3 = detail3Label.text!
        } else{
            detail3 = ""
        }
        //detail4
        if detail4Label.text != nil{
            detail4 = detail4Label.text!
        } else{
            detail4 = ""
        }
        
        //weight
        if units1Label.text != nil{
            length1 = units2Label.text!
        } else{
            length1 = ""
        }
        //length
        if units2Label.text != nil{
            weight1 = units1Label.text!
        } else{
            weight1 = ""
        }
        
        //working
        if workingHeightLabel.text != nil{
            working1 = workingHeightLabel.text!
        } else{
            working1 = ""
        }
        //platform
        if platformHeightLabel.text != nil{
            platform1 = platformHeightLabel.text!
        } else{
            platform1 = ""
        }
        
        //creeping
        if creepingField.text != nil {
            creeping1 = creepingField.text
        } else {
            creeping1 = ""
        }
        
        //client
        if nameField.text != nil {
            inspectorsname1 = nameField.text
        } else {
            inspectorsname1 = ""
        }
        //client
        if clientField.text != nil {
            client1 = clientField.text
        } else {
            client1 = ""
        }
        //date
        if dateField.text != nil {
            clientaddress1 = dateField.text
        } else {
            clientaddress1 = ""
        }
        //reg
        if regField.text != nil {
            reg1 = regField.text
        } else {
            reg1 = ""
        }
        //fleet
        if fleetField.text != nil {
            fleet1 = fleetField.text
        } else {
            fleet1 = ""
        }
        //location
        if locationField.text != nil {
            location1 = locationField.text
        } else {
            location1 = ""
        }
        //make
        if makeField.text != nil {
            make1 = makeField.text
        } else {
            make1 = ""
        }
        //serial
        if serialField.text != nil {
            serial1 = serialField.text
        } else {
            serial1 = ""
        }
        //model
        if modelField.text != nil {
            model1 = modelField.text
        } else {
            model1 = ""
        }
        //swl
        if swlField.text != nil {
            swl1 = swlField.text
        } else {
            swl1 = ""
        }
        //description
        if descriptionField.text != nil {
            description1 = descriptionField.text
        } else {
            description1 = ""
        }
        //maxconfig
        if maxConfigField.text != nil {
            maxconfig1 = maxConfigField.text
        } else {
            maxconfig1 = ""
        }
        //currentconfig
        if currentConfigField.text != nil {
            currentconfig1 = currentConfigField.text
        } else {
            currentconfig1 = ""
        }
        //swl1
        if swl1Field.text != nil {
            swl11 = swl1Field.text
        } else {
            swl11 = ""
        }
        //swl2
        if swl2Field.text != nil {
            swl21 = swl2Field.text
        } else {
            swl21 = ""
        }
        //swl3
        if swl3Field.text != nil {
            swl31 = swl3Field.text
        } else {
            swl31 = ""
        }
        //swl4
        if swl4Field.text != nil {
            swl41 = swl4Field.text
        } else {
            swl41 = ""
        }
        //appliedload1
        if appliedLoad1Field.text != nil {
            appliedload11 = appliedLoad1Field.text
        } else {
            appliedload11 = ""
        }
        //appliedload2
        if appliedLoad2Field.text != nil {
            appliedload21 = appliedLoad2Field.text
        } else {
            appliedload21 = ""
        }
        //appliedload3
        if appliedLoad3Field.text != nil {
            appliedload31 = appliedLoad3Field.text
        } else {
            appliedload31 = ""
        }
        //appliedload4
        if appliedLoad4Field.text != nil {
            appliedload41 = appliedLoad4Field.text
        } else {
            appliedload41 = ""
        }
        //boomlength1
        if boomLength1Field.text != nil {
            boomlength11 = boomLength1Field.text
        } else {
            boomlength11 = ""
        }
        //boomlength2
        if boomLength2Field.text != nil {
            boomlength21 = boomLength2Field.text
        } else {
            boomlength21 = ""
        }
        //boomlength3
        if boomLength3Field.text != nil {
            boomlength31 = boomLength3Field.text
        } else {
            boomlength31 = ""
        }
        //boomlength4
        if boomLength4Field.text != nil {
            boomlength41 = boomLength4Field.text
        } else {
            boomlength41 = ""
        }
        //radius1
        if radius1Field.text != nil {
            radius11 = radius1Field.text
        } else {
            radius11 = ""
        }
        //radius2
        if radius2Field.text != nil {
            radius21 = radius2Field.text
        }
        //radius3
        if radius3Field.text != nil {
            radius31 = radius3Field.text
        } else {
            radius31 = ""
        }
        //radius4
        if radius4Field.text != nil {
            radius41 = radius4Field.text
        } else {
            radius41 = ""
        }
        //testinfo
        if testInfoField.text != nil {
            testinfo1 = testInfoField.text
        } else {
            testinfo1 = ""
        }
        //timesheet
        if timesheetField.text != nil {
            timesheet1 = timesheetField.text
        } else {
            timesheet1 = ""
        }
        //previous cert
        if previousCertificateField.text != nil {
            previouscert1 = previousCertificateField.text
        } else {
            previouscert1 = ""
        }
        //previous cert date
        if previousExamDateField.text != nil {
            previousdate1 = previousExamDateField.text
        } else {
            previousdate1 = ""
        }
        //previous load test
        if loadTestCertField.text != nil {
            loadtestcert1 = loadTestCertField.text
        } else {
            loadtestcert1 = ""
        }
        //previous load test date
        if loadTestDateField.text != nil {
            loadtestdate1 = loadTestDateField.text
        } else {
            loadtestdate1 = ""
        }
        //type
        if typeField.text != nil {
            type1 = typeField.text
        } else {
            type1 = ""
        }
        if standardField.text != nil {
            standard1 = standardField.text!
        } else {
            standard1 = ""
        }
        
        //Backpage
        
        //mainlinepull
        if mainLinePullLabel.text != nil{
            mainlinepull = mainLinePullLabel.text!
        } else {
            mainlinepull = ""
        }
        //auxlinepull
        if auxLinePullLabel.text != nil{
            auxlinepull = auxLinePullLabel.text!
        } else {
            auxlinepull = ""
        }
        
        //superstructure
        if superstructureLabel.text != nil {
            superstructure1 = superstructureLabel.text
        } else {
            superstructure1 = ""
        }
        //idmarkings
        if idMarkingsLabel.text != nil {
            idmarkings1 = idMarkingsLabel.text
        } else {
            idmarkings1 = ""
        }
        //controls
        if controlLabel.text != nil {
            control1 = controlLabel.text
        } else {
            control1 = ""
        }
        //emergencystop
        if emergencyStopLabel.text != nil {
            emergencystop1 = emergencyStopLabel.text
        } else {
            emergencystop1 = ""
        }
        //wiring
        if wiringLabel.text != nil {
            wiring1 = wiringLabel.text
        } else {
            wiring1 = ""
        }
        //leakage
        if hydraulicLabel.text != nil {
            leaking1 = hydraulicLabel.text
        } else {
            leaking1 = ""
        }
        //speed
        if speedLabel.text != nil {
            speed1 = speedLabel.text
        } else {
            speed1 = ""
        }
        //slewing
        if slewingLabel.text != nil {
            slewing1 = slewingLabel.text
        } else {
            slewing1 = ""
        }
        //braking
        if brakingLabel.text != nil {
            braking1 = brakingLabel.text
        } else {
            braking1 = ""
        }
        //tyres
        if tyresLabel.text != nil {
            tyres1 = tyresLabel.text
        } else {
            tyres1 = ""
        }
        //outrigger
        if outriggerLabel.text != nil {
            outrigger1 = outriggerLabel.text
        } else {
            outrigger1 = ""
        }
        //sparkarrestor
        if sparkArrestorLabel.text != nil {
            sparkarrestor1 = sparkArrestorLabel.text
        } else {
            sparkarrestor1 = ""
        }
        //lights
        if lightsLabel.text != nil {
            lights1 = lightsLabel.text
        } else {
            lights1 = ""
        }
        //fireextinguisher
        if fireExtinguisherLabel.text != nil {
            fireextinguisher1 = fireExtinguisherLabel.text
        } else {
            fireextinguisher1 = ""
        }
        //wirerope
        if wireRopeLabel.text != nil {
            wirerope1 = wireRopeLabel.text
        } else {
            wirerope1 = ""
        }
        //mainwirecert
        if mainWireCertField.text != nil {
            mainwirecert1 = mainWireCertField.text
        } else {
            mainwirecert1 = ""
        }
        //auxwirecert
        if auxWireCertField.text != nil {
            auxwirecert1 = auxWireCertField.text
        } else {
            auxwirecert1 = ""
        }
        //counterweight
        if counterweightField.text != nil {
            counterweight1 = counterweightField.text
        } else {
            counterweight1 = ""
        }
        //ballast
        if ballastField.text != nil {
            ballast1 = ballastField.text
        } else {
            ballast1 = ""
        }
        //visual
        if visualLabel.text != nil {
            visual1 = visualLabel.text
        } else {
            visual1 = ""
        }
        //functions
        if functionsLabel.text != nil {
            functions1 = functionsLabel.text
        } else {
            functions1 = ""
        }
        //earthing
        if earthingLabel.text != nil {
            earthing1 = earthingLabel.text
        } else {
            earthing1 = ""
        }
        //manual
        if manualLabel.text != nil {
            manual1 = manualLabel.text
        } else {
            manual1 = ""
        }
        //ndt
        if ndtField.text != nil {
            ndt1 = ndtField.text
        } else {
            ndt1 = ""
        }
        //maintnance
        if maintenanceField.text != nil {
            maintenance1 = maintenanceField.text
        } else {
            maintenance1 = ""
        }
        //overload
        if overloadLabel.text != nil {
            overload1 = overloadLabel.text
        } else {
            overload1 = ""
        }
        //tilting
        if tiltingLabel.text != nil {
            tilting1 = tiltingLabel.text
        } else {
            tilting1 = ""
        }
        //emergencyfunctions
        if emergencyFunctionsLabel.text != nil {
            emergencyfunctions1 = emergencyFunctionsLabel.text
        } else {
            emergencyfunctions1 = ""
        }
        //mainwire
        if mainWireField.text != nil {
            mainwire1 = mainWireField.text
        } else {
            mainwire1 = ""
        }
        //auxwire
        if auxWireField.text != nil {
            auxwire1 = auxWireField.text
        } else {
            auxwire1 = ""
        }
        //trolleywire
        if trolleyWireField.text != nil {
            trolleywire1 = trolleyWireField.text
        } else {
            trolleywire1 = ""
        }
        //cabin
        if cabinLabel.text != nil {
            cabin1 = cabinLabel.text!
        } else {
            cabin1 = ""
        }
        //loadchart
        if loadChartLabel.text != nil {
            loadchart1 = loadChartLabel.text!
        } else {
            loadchart1 = ""
        }
        //chassis
        if chassisLabel.text != nil {
            chassis1 = chassisLabel.text!
        } else {
            chassis1 = ""
        }
        //fluid
        if fluidLabel.text != nil {
            fluid1 = fluidLabel.text!
        } else {
            fluid1 = ""
        }
        //connections
        if connectionsLabel.text != nil {
            connections1 = connectionsLabel.text!
        } else {
            connections1 = ""
        }
        //hook
        if hookLabel.text != nil {
            hook1 = hookLabel.text!
        } else {
            hook1 = ""
        }
        //cylinder
        if cylinderLabel.text != nil {
            cylinder1 = cylinderLabel.text!
        } else {
            cylinder1 = ""
        }
        //anemometer
        if anemometerLabel.text != nil {
            anemometer1 = anemometerLabel.text!
        } else {
            anemometer1 = ""
        }
        //limitswitch
        if limitSwitchesLabel.text != nil {
            limit1 = limitSwitchesLabel.text!
        } else {
            limit1 = ""
        }
        //batteries
        if batteriesLabel.text != nil {
            batteries1 = batteriesLabel.text!
        } else {
            batteries1 = ""
        }
        //date1
        if date1Field.text != nil {
            date11 = date1Field.text!
        } else {
            date11 = ""
        }
        //nextexam
        if nextExamDateLabel.text != nil {
            nextexam = nextExamDateLabel.text!
        } else {
            nextexam = ""
        }
        //nexttest
        if nextTestDateLabel.text != nil {
            nexttest = nextTestDateLabel.text!
        } else {
            nexttest = ""
        }
    }

    func dismissVC() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func createNewItem() {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Inspection", in: moc)
        
        let inspection = Inspection(entity: entityDescription!, insertInto:moc)
        
        inspection.radius = radius2Label.text
        inspection.boom = boomLabel.text
        inspection.auxlinepull = auxLinePullLabel.text
        inspection.mainlinepull = mainLinePullLabel.text
        inspection.comment4 = boomLengthLabel.text
        inspection.comment5 = RadiusLabel.text
        inspection.detail1 = detail1Label.text
        inspection.detail2 = detail2Label.text
        inspection.detail3 = detail3Label.text
        inspection.detail4 = detail4Label.text
        inspection.weight = units1Label.text
        inspection.length = units2Label.text
        inspection.swl0 = weight1Label.text
        inspection.appliedload0 = weight2Label.text
        inspection.boomlength0 = length1Label.text
        inspection.radius0 = length2Label.text
        inspection.creeping = creepingField.text
        inspection.client = clientField.text
        inspection.type = typeField.text
        inspection.name = nameField.text
        inspection.location = locationField.text
        inspection.date = dateField.text
        inspection.timesheet = timesheetField.text
        inspection.maintenance = maintenanceField.text
        inspection.ndt = ndtField.text
        inspection.previouscertificate = previousCertificateField.text
        inspection.previousexamdate = previousExamDateField.text
        inspection.loadtestcert = loadTestCertField.text
        inspection.loadtestdate = loadTestDateField.text
        inspection.mainwirecert = mainWireCertField.text
        inspection.auxwirecert = auxWireCertField.text
        inspection.descriptioncell = descriptionField.text
        inspection.make = makeField.text
        inspection.model = modelField.text
        inspection.serial = serialField.text
        inspection.fleet = fleetField.text
        inspection.reg = regField.text
        inspection.swl = swlField.text
        inspection.counterweight = counterweightField.text
        inspection.ballast = ballastField.text
        inspection.maxconfig = maxConfigField.text
        inspection.currentconfig = currentConfigField.text
        inspection.chassis = chassisLabel.text
        inspection.tyre = tyresLabel.text
        inspection.slewing = slewingLabel.text
        inspection.fluid = fluidLabel.text
        inspection.outrigger = outriggerLabel.text
        inspection.superstructure = superstructureLabel.text
        inspection.sparkarrestor = sparkArrestorLabel.text
        inspection.leakage = hydraulicLabel.text
        inspection.braking = brakingLabel.text
        inspection.connections = connectionsLabel.text
        inspection.mainwire = mainWireField.text
        inspection.auxwire = auxWireField.text
        inspection.trolleywire = trolleyWireField.text
        inspection.wirerope = wireRopeLabel.text
        inspection.hook = hookLabel.text
        inspection.cylinder = cylinderLabel.text
        inspection.control = controlLabel.text
        inspection.speed = speedLabel.text
        inspection.emergencystop = emergencyStopLabel.text
        inspection.limitswitch = limitSwitchesLabel.text
        inspection.wiring = wiringLabel.text
        inspection.batteries = batteriesLabel.text
        inspection.overload = overloadLabel.text
        inspection.tilting = tiltingLabel.text
        inspection.anemometer = anemometerLabel.text
        inspection.lights = lightsLabel.text
        inspection.earthing = earthingLabel.text
        inspection.functions = functionsLabel.text
        inspection.emergencyfunctions = emergencyFunctionsLabel.text
        inspection.swl1 = swl1Field.text
        inspection.swl2 = swl2Field.text
        inspection.swl3 = swl3Field.text
        inspection.swl4 = swl4Field.text
        inspection.appliedload1 = appliedLoad1Field.text
        inspection.appliedload2 = appliedLoad2Field.text
        inspection.appliedload3 = appliedLoad3Field.text
        inspection.appliedload4 = appliedLoad4Field.text
        inspection.boomlength1 = boomLength1Field.text
        inspection.boomlength2 = boomLength2Field.text
        inspection.boomlength3 = boomLength3Field.text
        inspection.boomlength4 = boomLength4Field.text
        inspection.testinfo = testInfoField.text
        inspection.fireextinguisher = fireExtinguisherLabel.text
        inspection.manual = manualLabel.text
        inspection.comment1 = reasonLabel.text
        inspection.radius1 = radius1Field.text
        inspection.radius2 = radius2Field.text
        inspection.radius3 = radius3Field.text
        inspection.radius4 = radius4Field.text
        inspection.visual = visualLabel.text
        inspection.idmarkings = idMarkingsLabel.text
        inspection.outcome = outcomeField.text
        inspection.standard = standardField.text
        inspection.cabincondition = cabinLabel.text
        inspection.loadchart = loadChartLabel.text
        inspection.nextexamdate = nextExamDateLabel.text
        inspection.nexttestdate = nextTestDateLabel.text
        inspection.working = workingHeightLabel.text
        inspection.platform = platformHeightLabel.text
        inspection.type = typeField.text
        
        inspection.reach = proofLoadLabel.text

        do {
            try moc.save()
        } catch {
            return
        }
    }
    func editItem() {
        inspection?.reach = proofLoadLabel.text
        
        inspection?.radius = radius2Label.text
        inspection?.boom = boomLabel.text
        inspection?.auxlinepull = auxLinePullLabel.text
        inspection?.mainlinepull = mainLinePullLabel.text
        inspection?.comment4 = boomLengthLabel.text
        inspection?.comment5 = RadiusLabel.text
        inspection?.comment1 = reasonLabel.text
        inspection?.comment2 = defectsText.text
        inspection?.comment3 = recommendationsText.text
        inspection?.detail1 = detail1Label.text
        inspection?.detail2 = detail2Label.text
        inspection?.detail3 = detail3Label.text
        inspection?.detail4 = detail4Label.text
        inspection?.weight = units1Label.text
        inspection?.length = units2Label.text
        inspection?.swl0 = weight1Label.text
        inspection?.appliedload0 = weight2Label.text
        inspection?.boomlength0 = length1Label.text
        inspection?.radius0 = length2Label.text
        inspection?.type = typeField.text
        inspection?.creeping = creepingField.text
        inspection?.client = clientField.text
        inspection?.type = typeField.text
        inspection?.name = nameField.text
        inspection?.location = locationField.text
        inspection?.date = dateField.text
        inspection?.timesheet = timesheetField.text
        inspection?.maintenance = maintenanceField.text
        inspection?.ndt = ndtField.text
        inspection?.previouscertificate = previousCertificateField.text
        inspection?.previousexamdate = previousExamDateField.text
        inspection?.loadtestcert = loadTestCertField.text
        inspection?.loadtestdate = loadTestDateField.text
        inspection?.mainwirecert = mainWireCertField.text
        inspection?.auxwirecert = auxWireCertField.text
        inspection?.descriptioncell = descriptionField.text
        inspection?.make = makeField.text
        inspection?.model = modelField.text
        inspection?.serial = serialField.text
        inspection?.fleet = fleetField.text
        inspection?.reg = regField.text
        inspection?.swl = swlField.text
        inspection?.counterweight = counterweightField.text
        inspection?.ballast = ballastField.text
        inspection?.maxconfig = maxConfigField.text
        inspection?.currentconfig = currentConfigField.text
        inspection?.chassis = chassisLabel.text
        inspection?.tyre = tyresLabel.text
        inspection?.slewing = slewingLabel.text
        inspection?.fluid = fluidLabel.text
        inspection?.outrigger = outriggerLabel.text
        inspection?.superstructure = superstructureLabel.text
        inspection?.sparkarrestor = sparkArrestorLabel.text
        inspection?.leakage = hydraulicLabel.text
        inspection?.braking = brakingLabel.text
        inspection?.connections = connectionsLabel.text
        inspection?.mainwire = mainWireField.text
        inspection?.auxwire = auxWireField.text
        inspection?.trolleywire = trolleyWireField.text
        inspection?.wirerope = wireRopeLabel.text
        inspection?.hook = hookLabel.text
        inspection?.cylinder = cylinderLabel.text
        inspection?.control = controlLabel.text
        inspection?.speed = speedLabel.text
        inspection?.emergencystop = emergencyStopLabel.text
        inspection?.limitswitch = limitSwitchesLabel.text
        inspection?.wiring = wiringLabel.text
        inspection?.batteries = batteriesLabel.text
        inspection?.overload = overloadLabel.text
        inspection?.tilting = tiltingLabel.text
        inspection?.anemometer = anemometerLabel.text
        inspection?.lights = lightsLabel.text
        inspection?.earthing = earthingLabel.text
        inspection?.functions = functionsLabel.text
        inspection?.emergencyfunctions = emergencyFunctionsLabel.text
        inspection?.swl1 = swl1Field.text
        inspection?.swl2 = swl2Field.text
        inspection?.swl3 = swl3Field.text
        inspection?.swl4 = swl4Field.text
        inspection?.appliedload1 = appliedLoad1Field.text
        inspection?.appliedload2 = appliedLoad2Field.text
        inspection?.appliedload3 = appliedLoad3Field.text
        inspection?.appliedload4 = appliedLoad4Field.text
        inspection?.boomlength1 = boomLength1Field.text
        inspection?.boomlength2 = boomLength2Field.text
        inspection?.boomlength3 = boomLength3Field.text
        inspection?.boomlength4 = boomLength4Field.text
        inspection?.testinfo = testInfoField.text
        inspection?.fireextinguisher = fireExtinguisherLabel.text
        inspection?.manual = manualLabel.text
        inspection?.radius1 = radius1Field.text
        inspection?.radius2 = radius2Field.text
        inspection?.radius3 = radius3Field.text
        inspection?.radius4 = radius4Field.text
        inspection?.idmarkings = idMarkingsLabel.text
        inspection?.visual = visualLabel.text
        inspection?.outcome = outcomeField.text
        inspection?.standard = standardField.text
        inspection?.loadchart = loadChartLabel.text
        inspection?.cabincondition = cabinLabel.text
        inspection?.nextexamdate = nextExamDateLabel.text
        inspection?.nexttestdate = nextTestDateLabel.text
        inspection?.working = workingHeightLabel.text
        inspection?.platform = platformHeightLabel.text
        inspection?.date1 = date1Field.text
        
        do {
            try moc.save()
        } catch {
            return
        }
    }
    
    //DatePickers
    var ExamAnswer = 0
    var TestAnswer = 0
    var ProofLoadAnswer = 0
    
    //outlets
    
    @IBOutlet weak var examLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var testPicker: UIPickerView!
    @IBOutlet weak var examPicker: UIPickerView!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var select2Button: UIButton!
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == examPicker {
            return examArray[row]
        } else if(pickerView == testPicker){
            return testArray[row]
        } else if(pickerView == workingHeightPicker){
            return workingArray[row]
        }else if(pickerView == platformHeightPicker){
            return platformArray[row]
        }else if(pickerView == typePicker){
            return typeArray[row]
        }else if (pickerView == test1Picker){
            return testInfoArray[row]
        }else if (pickerView == test2Picker){
            return testInfoArray[row]
        }else if (pickerView == test3Picker){
            return testInfoArray[row]
        }else if (pickerView == test4Picker){
            return testInfoArray[row]
        }else if (pickerView == units1Picker){
            return units1Array[row]
        }else if (pickerView == units2Picker){
            return units2Array[row]
        }else if (pickerView == detail1Picker){
            return detailArray[row]
        }else if (pickerView == detail2Picker){
            return detailArray[row]
        }else if (pickerView == detail3Picker){
            return detailArray[row]
        }else if (pickerView == detail4Picker){
            return detailArray[row]
        }else if (pickerView == proofLoadPicker){
            return detailArray[row]
        }else if (pickerView == reasonPicker){
            return reasonArray[row]
        }else if (pickerView == radius2Picker){
            return radius2Array[row]
        }else if (pickerView == boomPicker){
            return boomArray[row]
        }else if (pickerView == maintenancePicker){
            return maintenanceArray[row]
        }else {
            return allArray[row]
    }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == examPicker {
            return examArray.count
        } else if(pickerView == testPicker){
            return testArray.count
        } else if(pickerView == workingHeightPicker){
            return workingArray.count
        }else if(pickerView == platformHeightPicker){
            return platformArray.count
        }else if(pickerView == typePicker){
            return typeArray.count
        }else if(pickerView == test1Picker){
            return testInfoArray.count
        }else if(pickerView == test2Picker){
            return testInfoArray.count
        }else if(pickerView == test3Picker){
            return testInfoArray.count
        }else if(pickerView == test4Picker){
            return testInfoArray.count
        }else if(pickerView == units1Picker){
            return units1Array.count
        }else if(pickerView == units2Picker){
            return units2Array.count
        }else if (pickerView == detail1Picker){
            return detailArray.count
        }else if (pickerView == detail2Picker){
            return detailArray.count
        }else if (pickerView == detail3Picker){
            return detailArray.count
        }else if (pickerView == detail4Picker){
            return detailArray.count
        }else if (pickerView == reasonPicker){
            return reasonArray.count
        }else if (pickerView == radius2Picker){
            return radius2Array.count
        }else if (pickerView == boomPicker){
            return boomArray.count
        }else if (pickerView == proofLoadPicker){
            return detailArray.count
        }else if (pickerView == maintenancePicker){
            return maintenanceArray.count
        }else {
            return allArray.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    @IBAction func selectButtonPressed(_ sender: AnyObject) {
        if (ExamAnswer == 0){
            
        } else if(ExamAnswer == 1){
            dateLabel.text = "N/A"
        }
        else if(ExamAnswer == 2){
            dateLabel.text = "\(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        }
        else if(ExamAnswer == 3){
            dateLabel.text = "\(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
            
        }
    }
    
    @IBAction func select2ButtonPressed(_ sender: AnyObject) {
        if (TestAnswer == 0){
            
    }else if(TestAnswer == 1){
            testDateLabel.text = "N/A"
        }
        else if(TestAnswer == 2){
            testDateLabel.text = "\(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        }
        else if(TestAnswer == 3){
            testDateLabel.text = "\(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        }else if(TestAnswer == 4){
            testDateLabel.text = "\(DateFormatter.localizedString(from: fouryears!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    { if pickerView == examPicker {
        let exam1Label = UILabel()
        exam1Label.textColor = UIColor.black
        exam1Label.text = examArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        exam1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        exam1Label.textAlignment = NSTextAlignment.center
        return exam1Label
    } else if(pickerView == testPicker){
            let test1Label = UILabel()
            test1Label.textColor = UIColor.black
            test1Label.text = testArray[row]
            // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
            test1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
            test1Label.textAlignment = NSTextAlignment.center
            return test1Label
    }else if (pickerView == workingHeightPicker) {
        let workingLabel = UILabel()
        workingLabel.textColor = UIColor.black
        workingLabel.text = workingArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        workingLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        workingLabel.textAlignment = NSTextAlignment.center
        return workingLabel
    }else if (pickerView == platformHeightPicker) {
        let platformLabel = UILabel()
        platformLabel.textColor = UIColor.black
        platformLabel.text = platformArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        platformLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        platformLabel.textAlignment = NSTextAlignment.center
        return platformLabel
    }else if (pickerView == typePicker) {
        let typeLabel = UILabel()
        typeLabel.textColor = UIColor.black
        typeLabel.text = typeArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        typeLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        typeLabel.textAlignment = NSTextAlignment.center
        return typeLabel
    }else if (pickerView == test1Picker) {
        let test1Label = UILabel()
        test1Label.textColor = UIColor.black
        test1Label.text = testInfoArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        test1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        test1Label.textAlignment = NSTextAlignment.center
        return test1Label
    }else if (pickerView == test2Picker) {
        let test2Label = UILabel()
        test2Label.textColor = UIColor.black
        test2Label.text = testInfoArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        test2Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        test2Label.textAlignment = NSTextAlignment.center
        return test2Label
    }else if (pickerView == test3Picker) {
        let test3Label = UILabel()
        test3Label.textColor = UIColor.black
        test3Label.text = testInfoArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        test3Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        test3Label.textAlignment = NSTextAlignment.center
        return test3Label
    }else if (pickerView == test4Picker) {
        let test4Label = UILabel()
        test4Label.textColor = UIColor.black
        test4Label.text = testInfoArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        test4Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        test4Label.textAlignment = NSTextAlignment.center
        return test4Label
    }else if (pickerView == units1Picker) {
        let units1Label = UILabel()
        units1Label.textColor = UIColor.black
        units1Label.text = units1Array[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        units1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        units1Label.textAlignment = NSTextAlignment.center
        return units1Label
    }else if (pickerView == units2Picker) {
        let units2Label = UILabel()
        units2Label.textColor = UIColor.black
        units2Label.text = units2Array[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        units2Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        units2Label.textAlignment = NSTextAlignment.center
        return units2Label
    }else if (pickerView == detail1Picker) {
        let detail1Label = UILabel()
        detail1Label.textColor = UIColor.black
        detail1Label.text = detailArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        detail1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        detail1Label.textAlignment = NSTextAlignment.center
        return detail1Label
    }else if (pickerView == detail2Picker) {
        let detail2Label = UILabel()
        detail2Label.textColor = UIColor.black
        detail2Label.text = detailArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        detail2Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        detail2Label.textAlignment = NSTextAlignment.center
        return detail2Label
    }else if (pickerView == detail3Picker) {
        let detail3Label = UILabel()
        detail3Label.textColor = UIColor.black
        detail3Label.text = detailArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        detail3Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        detail3Label.textAlignment = NSTextAlignment.center
        return detail3Label
    }else if (pickerView == detail4Picker) {
        let detail4Label = UILabel()
        detail4Label.textColor = UIColor.black
        detail4Label.text = detailArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        detail4Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        detail4Label.textAlignment = NSTextAlignment.center
        return detail4Label
    }else if (pickerView == proofLoadPicker) {
        let proofloadLabel = UILabel()
        proofloadLabel.textColor = UIColor.black
        proofloadLabel.text = detailArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        proofloadLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        proofloadLabel.textAlignment = NSTextAlignment.center
        return proofloadLabel
    }else if (pickerView == reasonPicker) {
        let reason1Label = UILabel()
        reason1Label.textColor = UIColor.black
        reason1Label.text = reasonArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        reason1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        reason1Label.textAlignment = NSTextAlignment.center
        return reason1Label
    }else if (pickerView == radius2Picker) {
        let radius21Label = UILabel()
        radius21Label.textColor = UIColor.black
        radius21Label.text = radius2Array[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        radius21Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        radius21Label.textAlignment = NSTextAlignment.center
        return radius21Label
    }else if (pickerView == boomPicker) {
        let boom1Label = UILabel()
        boom1Label.textColor = UIColor.black
        boom1Label.text = boomArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        boom1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        boom1Label.textAlignment = NSTextAlignment.center
        return boom1Label
    }else if (pickerView == maintenancePicker) {
        let maintenance1Label = UILabel()
        maintenance1Label.textColor = UIColor.black
        maintenance1Label.text = maintenanceArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        maintenance1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        maintenance1Label.textAlignment = NSTextAlignment.center
        return maintenance1Label
    } else  {
        let allLabel = UILabel()
        allLabel.textColor = UIColor.black
        allLabel.text = allArray[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        allLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        allLabel.textAlignment = NSTextAlignment.center
        return allLabel
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == examPicker {
            ExamAnswer = row
        } else if(pickerView == testPicker){
            TestAnswer = row
        } else if(pickerView == manualPicker){
            ManualAnswer = row
        } else if(pickerView == idMarkingsPicker){
            idMarkingsAnswer = row
        } else if(pickerView == cabinPicker){
            CabinAnswer = row
        } else if(pickerView == fireExtinguisherPicker){
            FireExtinguisherAnswer = row
        } else if(pickerView == visualPicker){
            VisualAnswer = row
        } else if(pickerView == loadChartPicker){
            LoadChartAnswer = row
        } else if(pickerView == chassisPicker){
            ChassisAnswer = row
        }else if(pickerView == slewingPicker){
            SlewingAnswer = row
        }else if(pickerView == outriggerPicker){
            OutriggerAnswer = row
        }else if(pickerView == sparkArrestorPicker){
            SparkArrestorAnswer = row
        }else if(pickerView == brakingPicker){
            BrakingAnswer = row
        }else if(pickerView == hookPicker){
            HookAnswer = row
        }else if(pickerView == tyresPicker){
            TyresAnswer = row
        }else if(pickerView == fluidPicker){
            FluidAnswer = row
        }else if(pickerView == superstructurePicker){
            SuperstructureAnswer = row
        }else if(pickerView == hydraulicPicker){
            HydraulicAnswer = row
        }else if(pickerView == connectionsPicker){
            ConnectionAnswer = row
        }else if(pickerView == wireRopePicker){
            WireRopeAnswer = row
        }else if(pickerView == cylinderPicker){
            CylinderAnswer = row
        }else if(pickerView == controlsPicker){
            ControlAnswer = row
        }else if(pickerView == emergencyStopPicker){
            EmergencyStopAnswer = row
        }else if(pickerView == wiringPicker){
            WiringAnswer = row
        }else if(pickerView == overloadPicker){
            OverloadAnswer = row
            
        }else if(pickerView == anemometerPicker){
            AnemometerAnswer = row
        }else if(pickerView == earthingPicker){
            EarthingAnswer = row
        }else if(pickerView == speedPicker){
            SpeedAnswer = row
        }else if(pickerView == limitSwitchPicker){
            LimitSwitchesAnswer = row
        }else if(pickerView == batteriesPicker){
            BatteriesAnswer = row
        }else if(pickerView == tiltingPicker){
            TiltingAnswer = row
        }else if(pickerView == lightsPicker){
            LightsAnswer = row
        }else if(pickerView == functionsPicker){
            FunctionsAnswer = row
        }else if(pickerView == emergencyFunctionsPicker){
            EmergencyFunctionsAnswer = row
        }else if (pickerView == workingHeightPicker){
            WorkingHeightAnswer = row
        }else if (pickerView == platformHeightPicker){
            PlatformHeightAnswer = row
        }else if (pickerView == typePicker){
            TypeAnswer = row
        }else if (pickerView == test1Picker){
            Test1Answer = row
            test1Label.text = testInfoArray[row]
        }else if (pickerView == test2Picker){
            Test2Answer = row
            test2Label.text = testInfoArray[row]
        }else if (pickerView == test3Picker){
            Test3Answer = row
            test3Label.text = testInfoArray[row]
        }else if (pickerView == test4Picker){
            Test4Answer = row
            test4Label.text = testInfoArray[row]
        }else if (pickerView == units1Picker){
            Units1Answer = row
        }else if (pickerView == units2Picker){
            Units2Answer = row
        }else if (pickerView == detail1Picker){
            Detail1Answer = row
        }else if (pickerView == detail2Picker){
            Detail2Answer = row
        }else if (pickerView == detail3Picker){
            Detail3Answer = row
        }else if (pickerView == detail4Picker){
            Detail4Answer = row
        }else if (pickerView == reasonPicker){
            ReasonAnswer = row
        }else if (pickerView == radius2Picker){
            RadiusAnswer = row
        }else if (pickerView == boomPicker){
            BoomAnswer = row
        }else if (pickerView == proofLoadPicker){
            ProofLoadAnswer = row
        }else if (pickerView == maintenancePicker){
            MaintenanceAnswer = row
        }
    }
    

    

}
