//
//  JCCertificate1ViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 14/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Foundation

var defects1 = String()
var recommendations1 = String()
var client1: String?
var clientaddress1: String?
var reg1: String?
var fleet1: String?
var location1: String?
var make1: String?
var serial1: String?
var model1: String?
var swl1: String?
var swl11: String?
var swl21: String?
var swl31: String?
var swl41: String?
var radius11: String?
var radius21: String?
var radius31: String?
var radius41: String?
var description1: String?
var maxconfig1: String?
var currentconfig1: String?
var appliedload11: String?
var appliedload21: String?
var appliedload31: String?
var appliedload41: String?
var boomlength11: String?
var boomlength21: String?
var boomlength31: String?
var boomlength41: String?
var testinfo1: String?
var comment11: String?
var comment21: String?
var comment31: String?
var comment41: String?
var comment51: String?
var timesheet1: String?
var inspectorsname1: String?
var reach1: String?
var loadtestcert1: String?
var loadtestdate1: String?
var previouscert1: String?
var previousdate1: String?
var type1: String?
var dateString = String()
var standard1 = String()
var nextexam = String()
var nexttest = String()
var chassis1 = String()
var cabin1 = String()
var loadchart1 = String()
var fluid1 = String()
var connections1 = String()
var hook1 = String()
var cylinder1 = String()
var anemometer1 = String()
var limit1 = String()
var batteries1 = String()
var working1 = String()
var platform1 = String()
var reach2 = String()
var weight1 = String()
var length1 = String()
var detail1 = String()
var detail2 = String()
var detail3 = String()
var detail4 = String()
var reason1 = String()
var boomlength1 = String()
var radius1 = String()

var radiusString = String()
var boom1 = String()

var DATE = String()

class JCCertificate1ViewController: UIViewController , UITextFieldDelegate{
    
    
    
    //Outlets
    
    @IBOutlet weak var proofLoadNoField: UITextField!
    @IBOutlet weak var proofLoadNAField: UITextField!
    @IBOutlet weak var proofLoadYesField: UITextField!
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
    @IBOutlet weak var timesheetLabel: UILabel!
    @IBOutlet weak var issueDateLabel: UILabel!
    @IBOutlet weak var inspectorsNameLabel: UILabel!
    @IBOutlet weak var clientAddressLabel: UILabel!
    @IBOutlet weak var standardLabel: UILabel!
    @IBOutlet weak var nextExamField: UITextField!
    @IBOutlet weak var nextTestField: UITextField!
    @IBOutlet weak var workingHeightLabel: UILabel!
    @IBOutlet weak var platformHeightLabel: UILabel!
    @IBOutlet weak var reach1Label: UILabel!
    @IBOutlet weak var previousCertificateLabel: UILabel!
    @IBOutlet weak var previousExamDateLabel: UILabel!
    @IBOutlet weak var loadTestDateLabel: UILabel!
    @IBOutlet weak var loadTestCertLabel: UILabel!
    @IBOutlet weak var typeField: UILabel!
    @IBOutlet weak var weight1Label: UILabel!
    @IBOutlet weak var weight2Label: UILabel!
    @IBOutlet weak var length1Label: UILabel!
    @IBOutlet weak var length2Label: UILabel!
    @IBOutlet weak var radius99: UILabel!
    @IBOutlet weak var boom: UILabel!

    @IBOutlet weak var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nextExamField.text = nextexam
        nextTestField.text = nexttest
    
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
        
        if type1 == "Thorough Examination"{
            typeField.text = "of Thorough Examination of Lifting Appliance"
            
        } else if type1 == "Test & Thorough Examination"{
            typeField.text = "of Test & Thorough Examination of Lifting Appliance"
        } else{
            typeField.text = ""
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
        
        nextExamField.text = nextexam
        nextTestField.text = nexttest
        workingHeightLabel.text = working1

        platformHeightLabel.text = platform1

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

}
