//
//  JCAddViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 13/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData

class JCAddViewController: UIViewController {

    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    //Core Data
        var inspection : Inspection? = nil
        let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext

    //Outlets
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var date1Field: UITextField!
    
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        date1Field.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        createNewItem()
        dismissVC()
    }
    

    //Functions
    func createNewItem() {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Inspection", in: moc)
        
        let inspection = Inspection(entity: entityDescription!, insertInto:moc)
        
        inspection.id = idField?.text
        inspection.client = clientField?.text
        inspection.date1 = date1Field?.text
        inspection.outcome = outcomeLabel?.text
        do {
            try moc.save()
        } catch {
            return
        }
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

}
