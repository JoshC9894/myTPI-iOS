//
//  JCLGChecklist1.swift
//  Astron Group
//
//  Created by Joshua Colley on 19/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData

class JCLGChecklist1: UITableViewController, NSFetchedResultsControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {
 
    
    //CoreData
    var loosegear : Loosegear? = nil
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    //PickerArrays
    var testArray = ["Swipe Up to Select","Not Applicable", "6 Months:    \(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))", "12 Months:    \(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))","4 Years:    \(DateFormatter.localizedString(from: fouryears!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"]
    
    var reasonArray = ["Swipe Up to Select", "A. Within an Interval of 6 Months", "B. In Accordance with an Examination Schedule", "C. After the Occurance of Exceptional Circumstances", "D. New Installation of Equipment", "E. Reconfiguration of Equipment"]
    
    //Inspection Details
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var timesheetField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var date1Field: UITextField!
    @IBOutlet weak var standardField: UITextField!
    @IBOutlet weak var colourCodingField: UITextField!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var reasonPicker: UIPickerView!
    @IBOutlet weak var reasonSelect: UIButton!
    @IBOutlet weak var nextTestLabel: UILabel!
    @IBOutlet weak var nextTestPicker: UIPickerView!
    @IBOutlet weak var nextTestSelect: UIButton!
    @IBOutlet weak var nextExamField: UITextField!
    @IBOutlet weak var commentsField: UITextField!
    
    var ReasonAnswer = 0
    var NextExamAnswer = 0
    var NextTestAnswer = 0
    
    //Item1
    @IBOutlet weak var id1Field: UITextField!
    @IBOutlet weak var make1Field: UITextField!
    @IBOutlet weak var swl1Field: UITextField!
    @IBOutlet weak var cert1Field: UITextField!
    @IBOutlet weak var description1Field: UITextField!
    @IBOutlet weak var load1Field: UITextField!
    
    //Item2
    @IBOutlet weak var id2Field: UITextField!
    @IBOutlet weak var make2Field: UITextField!
    @IBOutlet weak var swl2Field: UITextField!
    @IBOutlet weak var cert2Field: UITextField!
    @IBOutlet weak var description2Field: UITextField!
    @IBOutlet weak var load2Field: UITextField!
    
    //Item3
    @IBOutlet weak var id3Field: UITextField!
    @IBOutlet weak var make3Field: UITextField!
    @IBOutlet weak var swl3Field: UITextField!
    @IBOutlet weak var cert3Field: UITextField!
    @IBOutlet weak var description3Field: UITextField!
    @IBOutlet weak var load3Field: UITextField!
    
    //Item4
    @IBOutlet weak var id4Field: UITextField!
    @IBOutlet weak var make4Field: UITextField!
    @IBOutlet weak var swl4Field: UITextField!
    @IBOutlet weak var cert4Field: UITextField!
    @IBOutlet weak var description4Field: UITextField!
    @IBOutlet weak var load4Field: UITextField!
    
    //Item5
    @IBOutlet weak var id5Field: UITextField!
    @IBOutlet weak var make5Field: UITextField!
    @IBOutlet weak var swl5Field: UITextField!
    @IBOutlet weak var cert5Field: UITextField!
    @IBOutlet weak var description5Field: UITextField!
    @IBOutlet weak var load5Field: UITextField!
    
    //Item6
    @IBOutlet weak var id6Field: UITextField!
    @IBOutlet weak var make6Field: UITextField!
    @IBOutlet weak var swl6Field: UITextField!
    @IBOutlet weak var cert6Field: UITextField!
    @IBOutlet weak var description6Field: UITextField!
    @IBOutlet weak var load6Field: UITextField!
    
    //Item7
    @IBOutlet weak var id7Field: UITextField!
    @IBOutlet weak var make7Field: UITextField!
    @IBOutlet weak var swl7Field: UITextField!
    @IBOutlet weak var cert7Field: UITextField!
    @IBOutlet weak var description7Field: UITextField!
    @IBOutlet weak var load7Field: UITextField!
    
    //Item8
    @IBOutlet weak var id8Field: UITextField!
    @IBOutlet weak var make8Field: UITextField!
    @IBOutlet weak var swl8Field: UITextField!
    @IBOutlet weak var cert8Field: UITextField!
    @IBOutlet weak var description8Field: UITextField!
    @IBOutlet weak var load8Field: UITextField!
    
    //Item9
    @IBOutlet weak var id9Field: UITextField!
    @IBOutlet weak var make9Field: UITextField!
    @IBOutlet weak var swl9Field: UITextField!
    @IBOutlet weak var cert9Field: UITextField!
    @IBOutlet weak var description9Field: UITextField!
    @IBOutlet weak var load9Field: UITextField!
    
    //Item10
    @IBOutlet weak var id10Field: UITextField!
    @IBOutlet weak var make10Field: UITextField!
    @IBOutlet weak var swl10Field: UITextField!
    @IBOutlet weak var cert10Field: UITextField!
    @IBOutlet weak var description10Field: UITextField!
    @IBOutlet weak var load10Field: UITextField!
    
    //Item11
    @IBOutlet weak var id11Field: UITextField!
    @IBOutlet weak var make11Field: UITextField!
    @IBOutlet weak var swl11Field: UITextField!
    @IBOutlet weak var cert11Field: UITextField!
    @IBOutlet weak var description11Field: UITextField!
    @IBOutlet weak var load11Field: UITextField!
    
    //Item12
    @IBOutlet weak var id12Field: UITextField!
    @IBOutlet weak var make12Field: UITextField!
    @IBOutlet weak var swl12Field: UITextField!
    @IBOutlet weak var cert12Field: UITextField!
    @IBOutlet weak var description12Field: UITextField!
    @IBOutlet weak var load12Field: UITextField!
    
    //Item13
    @IBOutlet weak var id13Field: UITextField!
    @IBOutlet weak var make13Field: UITextField!
    @IBOutlet weak var swl13Field: UITextField!
    @IBOutlet weak var cert13Field: UITextField!
    @IBOutlet weak var description13Field: UITextField!
    @IBOutlet weak var load13Field: UITextField!
    
    //Item14
    @IBOutlet weak var id14Field: UITextField!
    @IBOutlet weak var make14Field: UITextField!
    @IBOutlet weak var swl14Field: UITextField!
    @IBOutlet weak var cert14Field: UITextField!
    @IBOutlet weak var description14Field: UITextField!
    @IBOutlet weak var load14Field: UITextField!
    
    //Item15
    @IBOutlet weak var id15Field: UITextField!
    @IBOutlet weak var make15Field: UITextField!
    @IBOutlet weak var swl15Field: UITextField!
    @IBOutlet weak var cert15Field: UITextField!
    @IBOutlet weak var description15Field: UITextField!
    @IBOutlet weak var load15Field: UITextField!
    
    //Item16
    @IBOutlet weak var id16Field: UITextField!
    @IBOutlet weak var make16Field: UITextField!
    @IBOutlet weak var swl16Field: UITextField!
    @IBOutlet weak var cert16Field: UITextField!
    @IBOutlet weak var description16Field: UITextField!
    @IBOutlet weak var load16Field: UITextField!
    
    //Item17
    @IBOutlet weak var id17Field: UITextField!
    @IBOutlet weak var make17Field: UITextField!
    @IBOutlet weak var swl17Field: UITextField!
    @IBOutlet weak var cert17Field: UITextField!
    @IBOutlet weak var description17Field: UITextField!
    @IBOutlet weak var load17Field: UITextField!
    
    //Item18
    @IBOutlet weak var id18Field: UITextField!
    @IBOutlet weak var make18Field: UITextField!
    @IBOutlet weak var swl18Field: UITextField!
    @IBOutlet weak var cert18Field: UITextField!
    @IBOutlet weak var description18Field: UITextField!
    @IBOutlet weak var load18Field: UITextField!
    
    //Item19
    @IBOutlet weak var id19Field: UITextField!
    @IBOutlet weak var make19Field: UITextField!
    @IBOutlet weak var swl19Field: UITextField!
    @IBOutlet weak var cert19Field: UITextField!
    @IBOutlet weak var description19Field: UITextField!
    @IBOutlet weak var load19Field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reasonPicker.dataSource = self
        reasonPicker.delegate = self
        nextTestPicker.dataSource = self
        nextTestPicker.delegate = self
        
        nextExamField.text = DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
        if loosegear != nil {
            clientField.text = loosegear?.client
            locationField.text = loosegear?.location
            addressField.text = loosegear?.address
            timesheetField.text = loosegear?.timesheet
            nameField.text = loosegear?.inspector
            date1Field.text = loosegear?.date
            standardField.text = loosegear?.standard
            colourCodingField.text = loosegear?.colour
            reasonLabel.text = loosegear?.reason
            nextExamField.text = loosegear?.nextexam
            nextTestLabel.text = loosegear?.nexttest
            commentsField.text = loosegear?.comments
            
            id1Field.text = loosegear?.id1
            make1Field.text = loosegear?.make1
            swl1Field.text = loosegear?.swl1
            cert1Field.text = loosegear?.cert1
            description1Field.text = loosegear?.desc1
            load1Field.text = loosegear?.load1
            
            id2Field.text = loosegear?.id2
            make2Field.text = loosegear?.make2
            swl2Field.text = loosegear?.swl2
            cert2Field.text = loosegear?.cert2
            description2Field.text = loosegear?.desc2
            load2Field.text = loosegear?.load2
            
            id3Field.text = loosegear?.id3
            make3Field.text = loosegear?.make3
            swl3Field.text = loosegear?.swl3
            cert3Field.text = loosegear?.cert3
            description3Field.text = loosegear?.desc3
            load3Field.text = loosegear?.load3
            
            id4Field.text = loosegear?.id4
            make4Field.text = loosegear?.make4
            swl4Field.text = loosegear?.swl4
            cert4Field.text = loosegear?.cert4
            description4Field.text = loosegear?.desc4
            load4Field.text = loosegear?.load4
            
            id5Field.text = loosegear?.id5
            make5Field.text = loosegear?.make5
            swl5Field.text = loosegear?.swl5
            cert5Field.text = loosegear?.cert5
            description5Field.text = loosegear?.desc5
            load5Field.text = loosegear?.load5
            
            id6Field.text = loosegear?.id6
            make6Field.text = loosegear?.make6
            swl6Field.text = loosegear?.swl6
            cert6Field.text = loosegear?.cert6
            description6Field.text = loosegear?.desc6
            load6Field.text = loosegear?.load6
            
            id7Field.text = loosegear?.id7
            make7Field.text = loosegear?.make7
            swl7Field.text = loosegear?.swl7
            cert7Field.text = loosegear?.cert7
            description7Field.text = loosegear?.desc7
            load7Field.text = loosegear?.load7
            
            id8Field.text = loosegear?.id8
            make8Field.text = loosegear?.make8
            swl8Field.text = loosegear?.swl8
            cert8Field.text = loosegear?.cert8
            description8Field.text = loosegear?.desc8
            load8Field.text = loosegear?.load8
            
            id9Field.text = loosegear?.id9
            make9Field.text = loosegear?.make9
            swl9Field.text = loosegear?.swl9
            cert9Field.text = loosegear?.cert9
            description9Field.text = loosegear?.desc9
            load9Field.text = loosegear?.load9
            
            id10Field.text = loosegear?.id10
            make10Field.text = loosegear?.make10
            swl10Field.text = loosegear?.swl10
            cert10Field.text = loosegear?.cert10
            description10Field.text = loosegear?.desc10
            load10Field.text = loosegear?.load10
            
            id11Field.text = loosegear?.id11
            make11Field.text = loosegear?.make11
            swl11Field.text = loosegear?.swl11
            cert11Field.text = loosegear?.cert11
            description11Field.text = loosegear?.desc11
            load11Field.text = loosegear?.load11
            
            id12Field.text = loosegear?.id12
            make12Field.text = loosegear?.make12
            swl12Field.text = loosegear?.swl12
            cert12Field.text = loosegear?.cert12
            description12Field.text = loosegear?.desc12
            load12Field.text = loosegear?.load12
            
            id13Field.text = loosegear?.id13
            make13Field.text = loosegear?.make13
            swl13Field.text = loosegear?.swl13
            cert13Field.text = loosegear?.cert13
            description13Field.text = loosegear?.desc13
            load13Field.text = loosegear?.load13
            
            id14Field.text = loosegear?.id14
            make14Field.text = loosegear?.make14
            swl14Field.text = loosegear?.swl14
            cert14Field.text = loosegear?.cert14
            description14Field.text = loosegear?.desc14
            load14Field.text = loosegear?.load14
            
            id15Field.text = loosegear?.id15
            make15Field.text = loosegear?.make15
            swl15Field.text = loosegear?.swl15
            cert15Field.text = loosegear?.cert15
            description15Field.text = loosegear?.desc15
            load15Field.text = loosegear?.load15
            
            id16Field.text = loosegear?.id16
            make16Field.text = loosegear?.make16
            swl16Field.text = loosegear?.swl16
            cert16Field.text = loosegear?.cert16
            description16Field.text = loosegear?.desc16
            load16Field.text = loosegear?.load16
            
            id17Field.text = loosegear?.id17
            make17Field.text = loosegear?.make17
            swl17Field.text = loosegear?.swl17
            cert17Field.text = loosegear?.cert17
            description17Field.text = loosegear?.desc17
            load17Field.text = loosegear?.load17
            
            id18Field.text = loosegear?.id18
            make18Field.text = loosegear?.make18
            swl18Field.text = loosegear?.swl18
            cert18Field.text = loosegear?.cert18
            description18Field.text = loosegear?.desc18
            load18Field.text = loosegear?.load18
            
            id19Field.text = loosegear?.id19
            make19Field.text = loosegear?.make19
            swl19Field.text = loosegear?.swl19
            cert19Field.text = loosegear?.cert19
            description19Field.text = loosegear?.desc19
            load19Field.text = loosegear?.load19
            
        }
        
    }

    //Actions

    @IBAction func donePressed(_ sender: AnyObject) {
        dismissVC()
        if loosegear == nil{
            create()
        } else{
            edit()
        }
    }
    
    
    @IBAction func savePressed(_ sender: AnyObject) {
        if loosegear == nil{
            create()
        } else{
            edit()
        }
    }
    
    @IBAction func createPressed(_ sender: AnyObject) {
        //SETSTRINGS
        
        setString()
        
        if loosegear == nil{
            create()
        } else{
            edit()
        }
        
    }
    
    @IBAction func reasonSelected(_ sender: AnyObject) {
        if (ReasonAnswer == 0){
            reasonLabel.text = ""
        } else if (ReasonAnswer == 1){
            reasonLabel.text = "A"
        }else if (ReasonAnswer == 2){
            reasonLabel.text = "B"
        }else if (ReasonAnswer == 3){
            reasonLabel.text = "C"
        }else if (ReasonAnswer == 4){
            reasonLabel.text = "D"
        }else if (ReasonAnswer == 5){
            reasonLabel.text = "E"
        }
    }
    
    @IBAction func textSelected(_ sender: AnyObject) {
        if (NextTestAnswer == 0){
            nextTestLabel.text = ""
        } else if (NextTestAnswer == 1){
            nextTestLabel.text = "Not Applicable"
        } else if (NextTestAnswer == 2){
            nextTestLabel.text = "\(DateFormatter.localizedString(from: sixmonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        } else if (NextTestAnswer == 3){
            nextTestLabel.text = "\(DateFormatter.localizedString(from: twelvemonths!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        } else if (NextTestAnswer == 4){
            nextTestLabel.text = "\(DateFormatter.localizedString(from: fouryears!, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))"
        }
    }
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //Functions
    func dismissVC() {
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 21
    }
    
    let numberOfRowsAtSection: [Int] = [8, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows: Int = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }
    
    //Create Core Data Entry
    
    func create(){
        let entityDescription = NSEntityDescription.entity(forEntityName: "Loosegear", in: moc)
        
        let loosegear = Loosegear(entity: entityDescription!, insertInto:moc)
        
        loosegear.client = clientField.text
        loosegear.location = locationField.text
        loosegear.address = addressField.text
        loosegear.timesheet = timesheetField.text
        loosegear.inspector = nameField.text
        loosegear.date = date1Field.text
        loosegear.standard = standardField.text
        loosegear.colour = colourCodingField.text
        loosegear.nextexam = nextExamField.text
        loosegear.nexttest = nextTestLabel.text
        loosegear.reason = reasonLabel.text
        loosegear.comments = commentsField.text
        
        loosegear.id1 = id1Field.text
        loosegear.make1 = make1Field.text
        loosegear.swl1 = swl1Field.text
        loosegear.cert1 = cert1Field.text
        loosegear.desc1 = description1Field.text
        loosegear.load1 = load1Field.text
        
        loosegear.id2 = id2Field.text
        loosegear.make2 = make2Field.text
        loosegear.swl2 = swl2Field.text
        loosegear.cert2 = cert2Field.text
        loosegear.desc2 = description2Field.text
        loosegear.load2 = load2Field.text
        
        loosegear.id3 = id3Field.text
        loosegear.make3 = make3Field.text
        loosegear.swl3 = swl3Field.text
        loosegear.cert3 = cert3Field.text
        loosegear.desc3 = description3Field.text
        loosegear.load3 = load3Field.text
        
        loosegear.id4 = id4Field.text
        loosegear.make4 = make4Field.text
        loosegear.swl4 = swl4Field.text
        loosegear.cert4 = cert4Field.text
        loosegear.desc4 = description4Field.text
        loosegear.load4 = load4Field.text
        
        loosegear.id5 = id5Field.text
        loosegear.make5 = make5Field.text
        loosegear.swl5 = swl5Field.text
        loosegear.cert5 = cert5Field.text
        loosegear.desc5 = description5Field.text
        loosegear.load5 = load5Field.text
        
        loosegear.id6 = id6Field.text
        loosegear.make6 = make6Field.text
        loosegear.swl6 = swl6Field.text
        loosegear.cert6 = cert6Field.text
        loosegear.desc6 = description6Field.text
        loosegear.load6 = load6Field.text
        
        loosegear.id7 = id7Field.text
        loosegear.make7 = make7Field.text
        loosegear.swl7 = swl7Field.text
        loosegear.cert7 = cert7Field.text
        loosegear.desc7 = description7Field.text
        loosegear.load7 = load7Field.text
        
        loosegear.id8 = id8Field.text
        loosegear.make8 = make8Field.text
        loosegear.swl8 = swl8Field.text
        loosegear.cert8 = cert8Field.text
        loosegear.desc8 = description8Field.text
        loosegear.load8 = load8Field.text
        
        loosegear.id9 = id9Field.text
        loosegear.make9 = make9Field.text
        loosegear.swl9 = swl9Field.text
        loosegear.cert9 = cert9Field.text
        loosegear.desc9 = description9Field.text
        loosegear.load9 = load9Field.text
        
        loosegear.id10 = id10Field.text
        loosegear.make10 = make10Field.text
        loosegear.swl10 = swl10Field.text
        loosegear.cert10 = cert10Field.text
        loosegear.desc10 = description10Field.text
        loosegear.load10 = load10Field.text
        
        loosegear.id11 = id11Field.text
        loosegear.make11 = make11Field.text
        loosegear.swl11 = swl11Field.text
        loosegear.cert11 = cert11Field.text
        loosegear.desc11 = description11Field.text
        loosegear.load11 = load11Field.text
        
        loosegear.id12 = id12Field.text
        loosegear.make12 = make12Field.text
        loosegear.swl12 = swl12Field.text
        loosegear.cert12 = cert12Field.text
        loosegear.desc12 = description12Field.text
        loosegear.load12 = load12Field.text
        
        loosegear.id13 = id13Field.text
        loosegear.make13 = make13Field.text
        loosegear.swl13 = swl13Field.text
        loosegear.cert13 = cert13Field.text
        loosegear.desc13 = description13Field.text
        loosegear.load13 = load13Field.text
        
        loosegear.id14 = id14Field.text
        loosegear.make14 = make14Field.text
        loosegear.swl14 = swl14Field.text
        loosegear.cert14 = cert14Field.text
        loosegear.desc14 = description14Field.text
        loosegear.load14 = load14Field.text
        
        loosegear.id15 = id15Field.text
        loosegear.make15 = make15Field.text
        loosegear.swl15 = swl15Field.text
        loosegear.cert15 = cert15Field.text
        loosegear.desc15 = description15Field.text
        loosegear.load15 = load15Field.text
        
        loosegear.id16 = id16Field.text
        loosegear.make16 = make16Field.text
        loosegear.swl16 = swl16Field.text
        loosegear.cert16 = cert16Field.text
        loosegear.desc16 = description16Field.text
        loosegear.load16 = load16Field.text
        
        loosegear.id17 = id17Field.text
        loosegear.make17 = make17Field.text
        loosegear.swl17 = swl17Field.text
        loosegear.cert17 = cert17Field.text
        loosegear.desc17 = description17Field.text
        loosegear.load17 = load17Field.text
        
        loosegear.id18 = id18Field.text
        loosegear.make18 = make18Field.text
        loosegear.swl18 = swl18Field.text
        loosegear.cert18 = cert18Field.text
        loosegear.desc18 = description18Field.text
        loosegear.load18 = load18Field.text
        
        loosegear.id19 = id19Field.text
        loosegear.make19 = make19Field.text
        loosegear.swl19 = swl19Field.text
        loosegear.cert19 = cert19Field.text
        loosegear.desc19 = description19Field.text
        loosegear.load19 = load19Field.text
        
        do {
            try moc.save()
        } catch {
            return
        }
        
    }
    
    func edit(){
        
        loosegear?.client = clientField.text
        loosegear?.location = locationField.text
        loosegear?.address = addressField.text
        loosegear?.timesheet = timesheetField.text
        loosegear?.inspector = nameField.text
        loosegear?.date = date1Field.text
        loosegear?.standard = standardField.text
        loosegear?.colour = colourCodingField.text
        loosegear?.nextexam = nextExamField.text
        loosegear?.nexttest = nextTestLabel.text
        loosegear?.reason = reasonLabel.text
        loosegear?.comments = commentsField.text
        
        loosegear?.id1 = id1Field.text
        loosegear?.make1 = make1Field.text
        loosegear?.swl1 = swl1Field.text
        loosegear?.cert1 = cert1Field.text
        loosegear?.desc1 = description1Field.text
        loosegear?.load1 = load1Field.text
        
        loosegear?.id2 = id2Field.text
        loosegear?.make2 = make2Field.text
        loosegear?.swl2 = swl2Field.text
        loosegear?.cert2 = cert2Field.text
        loosegear?.desc2 = description2Field.text
        loosegear?.load2 = load2Field.text
        
        loosegear?.id3 = id3Field.text
        loosegear?.make3 = make3Field.text
        loosegear?.swl3 = swl3Field.text
        loosegear?.cert3 = cert3Field.text
        loosegear?.desc3 = description3Field.text
        loosegear?.load3 = load3Field.text
        
        loosegear?.id4 = id4Field.text
        loosegear?.make4 = make4Field.text
        loosegear?.swl4 = swl4Field.text
        loosegear?.cert4 = cert4Field.text
        loosegear?.desc4 = description4Field.text
        loosegear?.load4 = load4Field.text
        
        loosegear?.id5 = id5Field.text
        loosegear?.make5 = make5Field.text
        loosegear?.swl5 = swl5Field.text
        loosegear?.cert5 = cert5Field.text
        loosegear?.desc5 = description5Field.text
        loosegear?.load5 = load5Field.text
        
        loosegear?.id6 = id6Field.text
        loosegear?.make6 = make6Field.text
        loosegear?.swl6 = swl6Field.text
        loosegear?.cert6 = cert6Field.text
        loosegear?.desc6 = description6Field.text
        loosegear?.load6 = load6Field.text
        
        loosegear?.id7 = id7Field.text
        loosegear?.make7 = make7Field.text
        loosegear?.swl7 = swl7Field.text
        loosegear?.cert7 = cert7Field.text
        loosegear?.desc7 = description7Field.text
        loosegear?.load7 = load7Field.text
        
        loosegear?.id8 = id8Field.text
        loosegear?.make8 = make8Field.text
        loosegear?.swl8 = swl8Field.text
        loosegear?.cert8 = cert8Field.text
        loosegear?.desc8 = description8Field.text
        loosegear?.load8 = load8Field.text
        
        loosegear?.id9 = id9Field.text
        loosegear?.make9 = make9Field.text
        loosegear?.swl9 = swl9Field.text
        loosegear?.cert9 = cert9Field.text
        loosegear?.desc9 = description9Field.text
        loosegear?.load9 = load9Field.text
        
        loosegear?.id10 = id10Field.text
        loosegear?.make10 = make10Field.text
        loosegear?.swl10 = swl10Field.text
        loosegear?.cert10 = cert10Field.text
        loosegear?.desc10 = description10Field.text
        loosegear?.load10 = load10Field.text
        
        loosegear?.id11 = id11Field.text
        loosegear?.make11 = make11Field.text
        loosegear?.swl11 = swl11Field.text
        loosegear?.cert11 = cert11Field.text
        loosegear?.desc11 = description11Field.text
        loosegear?.load11 = load11Field.text
        
        loosegear?.id12 = id12Field.text
        loosegear?.make12 = make12Field.text
        loosegear?.swl12 = swl12Field.text
        loosegear?.cert12 = cert12Field.text
        loosegear?.desc12 = description12Field.text
        loosegear?.load12 = load12Field.text
        
        loosegear?.id13 = id13Field.text
        loosegear?.make13 = make13Field.text
        loosegear?.swl13 = swl13Field.text
        loosegear?.cert13 = cert13Field.text
        loosegear?.desc13 = description13Field.text
        loosegear?.load13 = load13Field.text
        
        loosegear?.id14 = id14Field.text
        loosegear?.make14 = make14Field.text
        loosegear?.swl14 = swl14Field.text
        loosegear?.cert14 = cert14Field.text
        loosegear?.desc14 = description14Field.text
        loosegear?.load14 = load14Field.text
        
        loosegear?.id15 = id15Field.text
        loosegear?.make15 = make15Field.text
        loosegear?.swl15 = swl15Field.text
        loosegear?.cert15 = cert15Field.text
        loosegear?.desc15 = description15Field.text
        loosegear?.load15 = load15Field.text
        
        loosegear?.id16 = id16Field.text
        loosegear?.make16 = make16Field.text
        loosegear?.swl16 = swl16Field.text
        loosegear?.cert16 = cert16Field.text
        loosegear?.desc16 = description16Field.text
        loosegear?.load16 = load16Field.text
        
        loosegear?.id17 = id17Field.text
        loosegear?.make17 = make17Field.text
        loosegear?.swl17 = swl17Field.text
        loosegear?.cert17 = cert17Field.text
        loosegear?.desc17 = description17Field.text
        loosegear?.load17 = load17Field.text
        
        loosegear?.id18 = id18Field.text
        loosegear?.make18 = make18Field.text
        loosegear?.swl18 = swl18Field.text
        loosegear?.cert18 = cert18Field.text
        loosegear?.desc18 = description18Field.text
        loosegear?.load18 = load18Field.text
        
        loosegear?.id19 = id19Field.text
        loosegear?.make19 = make19Field.text
        loosegear?.swl19 = swl19Field.text
        loosegear?.cert19 = cert19Field.text
        loosegear?.desc19 = description19Field.text
        loosegear?.load19 = load19Field.text
        
        do {
            try moc.save()
        } catch {
            return
        }
        
    }
    
    //String Function
    
    func setString(){
        
        if date1Field.text != nil{
            dateLG1 = date1Field.text!
        } else{
            dateLG1 = ""
        }
        if locationField.text != nil{
            locationLG1 = locationField.text!
        } else{
            locationLG1 = ""
        }
        if clientField.text != nil{
            clientLG1 = clientField.text!
        } else{
            clientLG1 = ""
        }
        if addressField.text != nil{
            addressLG1 = addressField.text!
        } else{
            addressLG1 = ""
        }
        if colourCodingField.text != nil{
            colourLG1 = colourCodingField.text!
        } else{
            colourLG1 = ""
        }
        if timesheetField.text != nil{
            timesheetLG1 = timesheetField.text!
        } else{
            timesheetLG1 = ""
        }
        if standardField.text != nil{
            standardLG1 = standardField.text!
        } else{
            standardLG1 = ""
        }
        if nameField.text != nil{
            inspectorLG1 = nameField.text!
        } else{
            inspectorLG1 = ""
        }
        if nextExamField.text != nil{
            nextExamLG1 = nextExamField.text!
        } else{
            nextExamLG1 = ""
        }
        if nextTestLabel.text != nil{
            nextTestLG1 = nextTestLabel.text!
        } else{
            nextTestLG1 = ""
        }
        if reasonLabel.text != nil{
            reasonLG1 = reasonLabel.text!
        } else{
            reasonLG1 = ""
        }
        if commentsField.text != nil{
            commentsLG1 = commentsField.text!
        } else{
            commentsLG1 = "-"
        }
        
        //ITEM1
        if id1Field.text != nil{
        id1LG1 = id1Field.text
        } else {
            id1LG1 = ""
        }
        
        if make1Field.text != nil{
            make1LG1 = make1Field.text!
        } else{
            make1LG1 = ""
        }
        if description1Field.text != nil{
            desc1LG1 = description1Field.text!
        } else{
            desc1LG1 = ""
        }
        if swl1Field.text != nil{
            swl1LG1 = swl1Field.text!
        } else{
            swl1LG1 = ""
        }
        if cert1Field.text != nil{
            cert1LG1 = cert1Field.text!
        } else{
            cert1LG1 = ""
        }
        if load1Field.text != nil{
            load1LG1 = load1Field.text!
        } else{
            load1LG1 = ""
        }
        
        //ITEM2
        if id2Field.text != nil{
            id2LG1 = id2Field.text!
        } else{
            id2LG1 = "-"
        }
        if make2Field.text != nil{
            make2LG1 = make2Field.text!
        } else{
            make2LG1 = "-"
        }
        if description2Field.text != nil{
            desc2LG1 = description2Field.text!
        } else{
            desc2LG1 = "-"
        }
        if swl2Field.text != nil{
            swl2LG1 = swl2Field.text!
        } else{
            swl2LG1 = "-"
        }
        if cert2Field.text != nil{
            cert2LG1 = cert2Field.text!
        } else{
            cert2LG1 = "-"
        }
        if load2Field.text != nil{
            load2LG1 = load2Field.text!
        } else{
            load2LG1 = "-"
        }
        
        //ITEM3
        if id3Field.text != nil{
            id3LG1 = id3Field.text!
        } else{
            id3LG1 = "-"
        }
        if make3Field.text != nil{
            make3LG1 = make3Field.text!
        } else{
            make3LG1 = "-"
        }
        if description3Field.text != nil{
            desc3LG1 = description3Field.text!
        } else{
            desc3LG1 = "-"
        }
        if swl3Field.text != nil{
            swl3LG1 = swl3Field.text!
        } else{
            swl3LG1 = "-"
        }
        if cert3Field.text != nil{
            cert3LG1 = cert3Field.text!
        } else{
            cert3LG1 = "-"
        }
        if load3Field.text != nil{
            load3LG1 = load3Field.text!
        } else{
            load3LG1 = "-"
        }
        
        //ITEM4
        if id4Field.text != nil{
            id4LG1 = id4Field.text!
        } else{
            id4LG1 = "-"
        }
        if make4Field.text != nil{
            make4LG1 = make4Field.text!
        } else{
            make4LG1 = "-"
        }
        if description4Field.text != nil{
            desc4LG1 = description4Field.text!
        } else{
            desc4LG1 = "-"
        }
        if swl4Field.text != nil{
            swl4LG1 = swl4Field.text!
        } else{
            swl4LG1 = "-"
        }
        if cert4Field.text != nil{
            cert4LG1 = cert4Field.text!
        } else{
            cert4LG1 = "-"
        }
        if load4Field.text != nil{
            load4LG1 = load4Field.text!
        } else{
            load4LG1 = "-"
        }
        
        //ITEM5
        if id5Field.text != nil{
            id5LG1 = id5Field.text!
        } else{
            id5LG1 = "-"
        }
        if make5Field.text != nil{
            make5LG1 = make5Field.text!
        } else{
            make5LG1 = "-"
        }
        if description5Field.text != nil{
            desc5LG1 = description5Field.text!
        } else{
            desc5LG1 = "-"
        }
        if swl5Field.text != nil{
            swl5LG1 = swl5Field.text!
        } else{
            swl5LG1 = "-"
        }
        if cert5Field.text != nil{
            cert5LG1 = cert5Field.text!
        } else{
            cert5LG1 = "-"
        }
        if load5Field.text != nil{
            load5LG1 = load5Field.text!
        } else{
            load5LG1 = "-"
        }
        
        //ITEM6
        if id6Field.text != nil{
            id6LG1 = id6Field.text!
        } else{
            id6LG1 = "-"
        }
        if make6Field.text != nil{
            make6LG1 = make6Field.text!
        } else{
            make6LG1 = "-"
        }
        if description6Field.text != nil{
            desc6LG1 = description6Field.text!
        } else{
            desc6LG1 = "-"
        }
        if swl6Field.text != nil{
            swl6LG1 = swl6Field.text!
        } else{
            swl6LG1 = "-"
        }
        if cert6Field.text != nil{
            cert6LG1 = cert6Field.text!
        } else{
            cert6LG1 = "-"
        }
        if load6Field.text != nil{
            load6LG1 = load6Field.text!
        } else{
            load6LG1 = "-"
        }
        
        //ITEM7
        if id7Field.text != nil{
            id7LG1 = id7Field.text!
        } else{
            id7LG1 = "-"
        }
        if make7Field.text != nil{
            make7LG1 = make7Field.text!
        } else{
            make7LG1 = "-"
        }
        if description7Field.text != nil{
            desc7LG1 = description7Field.text!
        } else{
            desc7LG1 = "-"
        }
        if swl7Field.text != nil{
            swl7LG1 = swl7Field.text!
        } else{
            swl7LG1 = "-"
        }
        if cert7Field.text != nil{
            cert7LG1 = cert7Field.text!
        } else{
            cert7LG1 = "-"
        }
        if load7Field.text != nil{
            load7LG1 = load7Field.text!
        } else{
            load7LG1 = "-"
        }
        
        //ITEM8
        if id8Field.text != nil{
            id8LG1 = id8Field.text!
        } else{
            id8LG1 = "-"
        }
        if make8Field.text != nil{
            make8LG1 = make8Field.text!
        } else{
            make8LG1 = "-"
        }
        if description8Field.text != nil{
            desc8LG1 = description8Field.text!
        } else{
            desc8LG1 = "-"
        }
        if swl8Field.text != nil{
            swl8LG1 = swl8Field.text!
        } else{
            swl8LG1 = "-"
        }
        if cert8Field.text != nil{
            cert8LG1 = cert8Field.text!
        } else{
            cert8LG1 = "-"
        }
        if load8Field.text != nil{
            load8LG1 = load8Field.text!
        } else{
            load8LG1 = "-"
        }
        
        //ITEM9
        if id9Field.text != nil{
            id9LG1 = id9Field.text!
        } else{
            id9LG1 = "-"
        }
        if make9Field.text != nil{
            make9LG1 = make9Field.text!
        } else{
            make9LG1 = "-"
        }
        if description9Field.text != nil{
            desc9LG1 = description9Field.text!
        } else{
            desc9LG1 = "-"
        }
        if swl9Field.text != nil{
            swl9LG1 = swl9Field.text!
        } else{
            swl9LG1 = "-"
        }
        if cert9Field.text != nil{
            cert9LG1 = cert9Field.text!
        } else{
            cert9LG1 = "-"
        }
        if load9Field.text != nil{
            load9LG1 = load9Field.text!
        } else{
            load9LG1 = "-"
        }
        //ITEM10
        if id10Field.text != nil{
            id10LG1 = id10Field.text!
        } else{
            id10LG1 = ""
        }
        if make10Field.text != nil{
            make10LG1 = make10Field.text!
        } else{
            make10LG1 = ""
        }
        if description10Field.text != nil{
            desc10LG1 = description10Field.text!
        } else{
            desc10LG1 = ""
        }
        if swl10Field.text != nil{
            swl10LG1 = swl10Field.text!
        } else{
            swl10LG1 = ""
        }
        if cert10Field.text != nil{
            cert10LG1 = cert10Field.text!
        } else{
            cert10LG1 = ""
        }
        if load10Field.text != nil{
            load10LG1 = load10Field.text!
        } else{
            load10LG1 = ""
        }
        
        //ITEM11
        if id11Field.text != nil{
            id11LG1 = id11Field.text!
        } else{
            id1LG1 = ""
        }
        if make11Field.text != nil{
            make11LG1 = make11Field.text!
        } else{
            make11LG1 = ""
        }
        if description11Field.text != nil{
            desc11LG1 = description11Field.text!
        } else{
            desc11LG1 = ""
        }
        if swl11Field.text != nil{
            swl11LG1 = swl11Field.text!
        } else{
            swl11LG1 = ""
        }
        if cert11Field.text != nil{
            cert11LG1 = cert11Field.text!
        } else{
            cert11LG1 = ""
        }
        if load11Field.text != nil{
            load11LG1 = load11Field.text!
        } else{
            load11LG1 = ""
        }
        
        //ITEM2
        if id12Field.text != nil{
            id12LG1 = id12Field.text!
        } else{
            id12LG1 = "-"
        }
        if make12Field.text != nil{
            make12LG1 = make12Field.text!
        } else{
            make12LG1 = "-"
        }
        if description12Field.text != nil{
            desc12LG1 = description12Field.text!
        } else{
            desc12LG1 = "-"
        }
        if swl12Field.text != nil{
            swl12LG1 = swl12Field.text!
        } else{
            swl12LG1 = "-"
        }
        if cert12Field.text != nil{
            cert12LG1 = cert12Field.text!
        } else{
            cert12LG1 = "-"
        }
        if load12Field.text != nil{
            load12LG1 = load12Field.text!
        } else{
            load12LG1 = "-"
        }
        
        //ITEM13
        if id13Field.text != nil{
            id13LG1 = id13Field.text!
        } else{
            id13LG1 = "-"
        }
        if make13Field.text != nil{
            make13LG1 = make13Field.text!
        } else{
            make13LG1 = "-"
        }
        if description13Field.text != nil{
            desc13LG1 = description13Field.text!
        } else{
            desc13LG1 = "-"
        }
        if swl13Field.text != nil{
            swl13LG1 = swl13Field.text!
        } else{
            swl13LG1 = "-"
        }
        if cert13Field.text != nil{
            cert13LG1 = cert13Field.text!
        } else{
            cert13LG1 = "-"
        }
        if load13Field.text != nil{
            load13LG1 = load13Field.text!
        } else{
            load13LG1 = "-"
        }
        
        //ITEM14
        if id14Field.text != nil{
            id14LG1 = id14Field.text!
        } else{
            id14LG1 = "-"
        }
        if make14Field.text != nil{
            make14LG1 = make14Field.text!
        } else{
            make14LG1 = "-"
        }
        if description14Field.text != nil{
            desc14LG1 = description14Field.text!
        } else{
            desc14LG1 = "-"
        }
        if swl4Field.text != nil{
            swl4LG1 = swl4Field.text!
        } else{
            swl4LG1 = "-"
        }
        if cert14Field.text != nil{
            cert14LG1 = cert14Field.text!
        } else{
            cert14LG1 = "-"
        }
        if load14Field.text != nil{
            load14LG1 = load14Field.text!
        } else{
            load14LG1 = "-"
        }
        
        //ITEM15
        if id15Field.text != nil{
            id15LG1 = id15Field.text!
        } else{
            id15LG1 = "-"
        }
        if make15Field.text != nil{
            make15LG1 = make15Field.text!
        } else{
            make15LG1 = "-"
        }
        if description15Field.text != nil{
            desc15LG1 = description15Field.text!
        } else{
            desc15LG1 = "-"
        }
        if swl15Field.text != nil{
            swl15LG1 = swl15Field.text!
        } else{
            swl15LG1 = "-"
        }
        if cert15Field.text != nil{
            cert15LG1 = cert15Field.text!
        } else{
            cert15LG1 = "-"
        }
        if load15Field.text != nil{
            load15LG1 = load15Field.text!
        } else{
            load15LG1 = "-"
        }
        
        //ITEM16
        if id16Field.text != nil{
            id16LG1 = id16Field.text!
        } else{
            id16LG1 = "-"
        }
        if make16Field.text != nil{
            make16LG1 = make16Field.text!
        } else{
            make16LG1 = "-"
        }
        if description16Field.text != nil{
            desc16LG1 = description16Field.text!
        } else{
            desc16LG1 = "-"
        }
        if swl16Field.text != nil{
            swl16LG1 = swl16Field.text!
        } else{
            swl16LG1 = "-"
        }
        if cert16Field.text != nil{
            cert16LG1 = cert16Field.text!
        } else{
            cert16LG1 = "-"
        }
        if load16Field.text != nil{
            load16LG1 = load16Field.text!
        } else{
            load16LG1 = "-"
        }
        
        //ITEM17
        if id17Field.text != nil{
            id17LG1 = id17Field.text!
        } else{
            id17LG1 = "-"
        }
        if make17Field.text != nil{
            make17LG1 = make17Field.text!
        } else{
            make17LG1 = "-"
        }
        if description17Field.text != nil{
            desc17LG1 = description17Field.text!
        } else{
            desc17LG1 = "-"
        }
        if swl17Field.text != nil{
            swl17LG1 = swl17Field.text!
        } else{
            swl17LG1 = "-"
        }
        if cert17Field.text != nil{
            cert17LG1 = cert17Field.text!
        } else{
            cert17LG1 = "-"
        }
        if load17Field.text != nil{
            load17LG1 = load17Field.text!
        } else{
            load17LG1 = "-"
        }
        
        //ITEM18
        if id18Field.text != nil{
            id18LG1 = id18Field.text!
        } else{
            id18LG1 = "-"
        }
        if make18Field.text != nil{
            make18LG1 = make18Field.text!
        } else{
            make18LG1 = "-"
        }
        if description18Field.text != nil{
            desc18LG1 = description18Field.text!
        } else{
            desc18LG1 = "-"
        }
        if swl18Field.text != nil{
            swl18LG1 = swl18Field.text!
        } else{
            swl18LG1 = "-"
        }
        if cert18Field.text != nil{
            cert18LG1 = cert18Field.text!
        } else{
            cert18LG1 = "-"
        }
        if load18Field.text != nil{
            load18LG1 = load18Field.text!
        } else{
            load18LG1 = "-"
        }
        
        //ITEM19
        if id19Field.text != nil{
            id19LG1 = id19Field.text!
        } else{
            id19LG1 = "-"
        }
        if make19Field.text != nil{
            make19LG1 = make19Field.text!
        } else{
            make19LG1 = "-"
        }
        if description19Field.text != nil{
            desc19LG1 = description19Field.text!
        } else{
            desc19LG1 = "-"
        }
        if swl19Field.text != nil{
            swl19LG1 = swl19Field.text!
        } else{
            swl19LG1 = "-"
        }
        if cert19Field.text != nil{
            cert19LG1 = cert19Field.text!
        } else{
            cert19LG1 = "-"
        }
        if load19Field.text != nil{
            load19LG1 = load19Field.text!
        } else{
            load19LG1 = "-"
        }
    }
    
    
    
    
    
    //PickerFunctions

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == reasonPicker{
            return reasonArray[row]
        } else {
            return testArray[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == reasonPicker {
            return reasonArray.count
        } else {
            return testArray.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    { if pickerView == reasonPicker {
        let reason1Label = UILabel()
        reason1Label.textColor = UIColor.black
        reason1Label.text = reasonArray[row]
        reason1Label.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        reason1Label.textAlignment = NSTextAlignment.center
        return reason1Label
    } else {
        let testLabel = UILabel()
        testLabel.textColor = UIColor.black
        testLabel.text = testArray[row]
        testLabel.font = UIFont(name: "Helvetica", size: 14) // In this use your custom font
        testLabel.textAlignment = NSTextAlignment.center
        return testLabel
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == reasonPicker {
            ReasonAnswer = row
        } else {
            NextTestAnswer = row
        }
    }
}


