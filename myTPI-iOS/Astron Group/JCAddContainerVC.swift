//
//  JCAddContainerVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 16/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData

class JCAddContainerVC: UIViewController {
    

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var outcomeLabel: UILabel!
    
    //Core Data
    var container : Container? = nil
    let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateField.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
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
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Container", in: moc)
        
        let container = Container(entity: entityDescription!, insertInto:moc)
        
        container.id = idField?.text
        container.client = clientField?.text
        container.date1 = dateField?.text
        container.outcome = outcomeLabel?.text
        
        do {
            try moc.save()
        } catch {
            return
        }
    }
    
    func dismissVC() {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
