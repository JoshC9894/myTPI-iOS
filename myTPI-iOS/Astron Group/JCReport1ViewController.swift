//
//  JCCertificate1ViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 14/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData


class JCReport1ViewController: UIViewController {
    //Outlets
    
    @IBOutlet weak var recommendationsText: UITextView!
    @IBOutlet weak var defectsText: UITextView!
    
    @IBOutlet weak var detail1YesField: UITextField!
    @IBOutlet weak var detail1NAField: UITextField!
    @IBOutlet weak var detail1NoField: UITextField!
    
    @IBOutlet weak var detail2YesField: UITextField!
    @IBOutlet weak var detail2NAField: UITextField!
    @IBOutlet weak var detail2NoField: UITextField!
    
    @IBOutlet weak var detail3YesField: UITextField!
    @IBOutlet weak var detail3NAField: UITextField!
    @IBOutlet weak var detail3NoField: UITextField!
    
    @IBOutlet weak var detail4YesField: UITextField!
    @IBOutlet weak var detail4NAField: UITextField!
    @IBOutlet weak var detail4NoField: UITextField!
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var regLabel: UILabel!
    @IBOutlet weak var fleetLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var serialLabel: UILabel!
    @IBOutlet weak var swlLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var maxConfigLabel: UILabel!
    @IBOutlet weak var currentConfigLabel: UILabel!
    @IBOutlet weak var swl1Label: UILabel!
    @IBOutlet weak var swl2Label: UILabel!
    @IBOutlet weak var swl3Label: UILabel!
    @IBOutlet weak var swl4Label: UILabel!
    @IBOutlet weak var appliedLoad1Label: UILabel!
    @IBOutlet weak var appliedLoad2Label: UILabel!
    @IBOutlet weak var appliedLoad3Label: UILabel!
    @IBOutlet weak var appliedLoad4Label: UILabel!
    @IBOutlet weak var boomLength1Label: UILabel!
    @IBOutlet weak var boomLength2Label: UILabel!
    @IBOutlet weak var boomLength3Label: UILabel!
    @IBOutlet weak var boomLength4Label: UILabel!
    @IBOutlet weak var radius1Label: UILabel!
    @IBOutlet weak var radius2Label: UILabel!
    @IBOutlet weak var radius3Label: UILabel!
    @IBOutlet weak var radius4Label: UILabel!
    @IBOutlet weak var testInfoLabel: UILabel!
    
    @IBOutlet weak var boomLength: UILabel!
    @IBOutlet weak var radius: UILabel!
    
    
    @IBOutlet weak var reasonLabel: UILabel!
    
    @IBOutlet weak var notsafeLabel: UILabel!
    
    @IBOutlet weak var timesheetLabel: UILabel!
    @IBOutlet weak var issueDateLabel: UILabel!
    @IBOutlet weak var inspectorsNameLabel: UILabel!
    @IBOutlet weak var clientAddressLabel: UILabel!
    @IBOutlet weak var standardLabel: UILabel!
    @IBOutlet weak var nextExamField: UITextField!
    @IBOutlet weak var nextTestField: UITextField!
    
    @IBOutlet weak var workingHeightLabel: UILabel!
    @IBOutlet weak var platformHeightLabel: UILabel!
    
    @IBOutlet weak var previousCertificateLabel: UILabel!
    @IBOutlet weak var previousExamDateLabel: UILabel!
    
    @IBOutlet weak var loadTestDateLabel: UILabel!
    @IBOutlet weak var loadTestCertLabel: UILabel!
    
    @IBOutlet weak var weight1Label: UILabel!
    @IBOutlet weak var weight2Label: UILabel!
    @IBOutlet weak var weight3Label: UILabel!
    
    @IBOutlet weak var length1Label: UILabel!
    @IBOutlet weak var length2Label: UILabel!
    
    @IBOutlet weak var boom: UILabel!
    @IBOutlet weak var radius99: UILabel!
    
    @IBOutlet weak var proofLoadYesField: UITextField!
    @IBOutlet weak var proofLoadNAField: UITextField!
    @IBOutlet weak var proofLoadNoField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notsafeLabel.transform = CGAffineTransform(rotationAngle: -1)
        
        radius99.text = radiusString
        boom.text = boom1
        
        if boomlength1 != "" {
            boomLength.text = boomlength1
        } else {
            boomLength.text = "N/A"
        }
        
        if radius1 != "" {
            radius.text = radius1
        } else{
            radius.text = "N/A"
        }
        
        if recommendations1 != "" {
            recommendationsText.text = recommendations1
        } else {
            recommendationsText.text = "No Recommendations Given."
        }
        
        if defects1 != "" {
            defectsText.text = defects1
        } else{
            defectsText.text = "No Defects Found."
        }
        
        if detail1 == "Yes"{
            detail1YesField.text = "Yes"
            detail1NAField.text = "-"
            detail1NoField.text = "-"
        } else if (detail1 == "N/A"){
            detail1NAField.text = "N/A"
            detail1YesField.text = "-"
            detail1NoField.text = "-"
        } else if (detail1 == "No"){
            detail1NoField.text = "No"
            detail1YesField.text = "-"
            detail1NAField.text = "-"
        }
        
        if detail2 == "Yes"{
            detail2YesField.text = "Yes"
            detail2NAField.text = "-"
            detail2NoField.text = "-"
        } else if (detail2 == "N/A"){
            detail2NAField.text = "N/A"
            detail2YesField.text = "-"
            detail2NoField.text = "-"
        } else if (detail2 == "No"){
            detail2NoField.text = "No"
            detail2YesField.text = "-"
            detail2NAField.text = "-"
        }
        
        if detail3 == "Yes"{
            detail3YesField.text = "Yes"
            detail3NAField.text = "-"
            detail3NoField.text = "-"
        } else if (detail3 == "N/A"){
            detail3NAField.text = "N/A"
            detail3YesField.text = "-"
            detail3NoField.text = "-"
        } else if (detail3 == "No"){
            detail3NoField.text = "No"
            detail3YesField.text = "-"
            detail3NAField.text = "-"
        }
        
        if detail4 == "Yes"{
            detail4YesField.text = "Yes"
            detail4NAField.text = "-"
            detail4NoField.text = "-"
        } else if (detail4 == "N/A"){
            detail4NAField.text = "N/A"
            detail4YesField.text = "-"
            detail4NoField.text = "-"
        } else if (detail4 == "No"){
            detail4NoField.text = "No"
            detail4YesField.text = "-"
            detail4NAField.text = "-"
        }
        
        if reach1 == "Yes"{
            proofLoadYesField.text = "Yes"
            proofLoadNAField.text = "-"
            proofLoadNoField.text = "-"
        } else if (reach1 == "N/A"){
            proofLoadNAField.text = "N/A"
            proofLoadYesField.text = "-"
            proofLoadNoField.text = "-"
        } else if (reach1 == "No"){
            proofLoadNoField.text = "No"
            proofLoadYesField.text = "-"
            proofLoadNAField.text = "-"
        }
        
        
        if swl11 == "" {
            swl1Label.text = "-"
        } else {
            swl1Label.text = swl11
        }
        if swl21 == "" {
            swl2Label.text = "-"
        } else {
            swl2Label.text = swl21
        }
        if swl31 == "" {
            swl3Label.text = "-"
        } else {
            swl3Label.text = swl31
        }
        if swl41 == "" {
            swl4Label.text = "-"
        } else {
            swl4Label.text = swl41
        }
        
        if appliedload11 == "" {
            appliedLoad1Label.text = "-"
        } else {
            appliedLoad1Label.text = appliedload11
        }
        if appliedload21 == "" {
            appliedLoad2Label.text = "-"
        } else {
            appliedLoad2Label.text = appliedload21
        }
        if appliedload31 == "" {
            appliedLoad3Label.text = "-"
        } else {
            appliedLoad3Label.text = appliedload31
        }
        if appliedload41 == "" {
            appliedLoad4Label.text = "-"
        } else {
            appliedLoad4Label.text = appliedload41
        }
        
        if boomlength11 == "" {
            boomLength1Label.text = "-"
        } else {
            boomLength1Label.text = boomlength11
        }
        if boomlength21 == "" {
            boomLength2Label.text = "-"
        } else {
            boomLength2Label.text = boomlength21
        }
        if boomlength31 == "" {
            boomLength3Label.text = "-"
        } else {
            boomLength3Label.text = boomlength31
        }
        if boomlength41 == "" {
            boomLength4Label.text = "-"
        } else {
            boomLength4Label.text = boomlength41
        }
        
        if radius11 == "" {
            radius1Label.text = "-"
        } else {
            radius1Label.text = radius11
        }
        if radius21 == "" {
            radius2Label.text = "-"
        } else {
            radius2Label.text = radius21
        }
        if radius31 == "" {
            radius3Label.text = "-"
        } else {
            radius3Label.text = radius31
        }
        if radius41 == "" {
            radius4Label.text = "-"
        } else {
            radius4Label.text = radius41
        }
        if reason1 == "A"{
            reasonLabel.text = "Within an interval of 6 months"
        } else if (reason1 == "B"){
            reasonLabel.text = "Within an interval of 12 months"
        } else if (reason1 == "C"){
            reasonLabel.text = "In Accordance with an Examination Schedule"
        }else if (reason1 == "D"){
            reasonLabel.text = "After Occurance of Exceptional Circumstances"
        }else if (reason1 == "E"){
            reasonLabel.text = "New Installation of Equipment"
        }else if (reason1 == "F"){
            reasonLabel.text = "Reconfiguration of Equipment"
        }else if (reason1 == "G"){
            reasonLabel.text = "New Equipment"
        }
        
        if testinfo1 == "" {
            testInfoLabel.text = "No Additional Information"
        } else {
            testInfoLabel.text = testinfo1
        }
        
        weight1Label.text = weight1
        weight2Label.text = weight1
        length1Label.text = length1
        length2Label.text = length1
        clientLabel.text = client1
        
        if reg1 != "" {
            regLabel.text = reg1
        } else {
            regLabel.text = "N/A"
        }
        
        if fleet1 != ""{
            fleetLabel.text = fleet1
        }else{
            fleetLabel.text = "N/A"
        }
        
        locationLabel.text = location1
        makeLabel.text = make1
        serialLabel.text = serial1
        modelLabel.text = model1
        swlLabel.text = swl1
        descriptionLabel.text = description1
        
        if maxconfig1 != ""{
            maxConfigLabel.text = maxconfig1
        } else {
            maxConfigLabel.text = "N/A"
        }
        
        if currentconfig1 != ""{
            currentConfigLabel.text = currentconfig1
        } else {
            currentConfigLabel.text = "N/A"
        }
        
        timesheetLabel.text = timesheet1
        inspectorsNameLabel.text = inspectorsname1
        clientAddressLabel.text = clientaddress1
        
        if previouscert1 != ""{
            previousCertificateLabel.text = previouscert1
        } else {
            previousCertificateLabel.text = "Not Available"
        }
        
        if previousdate1 != ""{
            previousExamDateLabel.text = previousdate1
        } else {
            previousExamDateLabel.text = "-"
        }
        
        if loadtestcert1 != ""{
            loadTestCertLabel.text = loadtestcert1
        } else {
            loadTestCertLabel.text = "Not Available"
        }
        
        if loadtestdate1 != ""{
            loadTestDateLabel.text = loadtestdate1
        } else {
            loadtestdate1 = "-"
        }
        
        dateField.text = DATE
        
        
        issueDateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
        if standard1 != ""{
            standardLabel.text = standard1
        }else {
            standardLabel.text = "Local Regulations"
        }
        
        workingHeightLabel.text = working1
        
        platformHeightLabel.text = platform1
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
//date


}
