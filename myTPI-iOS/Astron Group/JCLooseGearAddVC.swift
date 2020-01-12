//
//  JCLooseGearAddVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 21/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData
import Parse

class JCLooseGearAddVC: UIViewController {
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    @IBOutlet weak var reportNumberField: UITextField!
    @IBOutlet weak var clientField: UITextField!
    @IBOutlet weak var date1Field: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    
//Core Data
var loosegear : Loosegear? = nil
let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext


override func viewDidLoad() {
    super.viewDidLoad()
    
    date1Field.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)

    }
    
    @IBAction func generatePressed(_ sender: AnyObject) {

        }
    
    
    @IBAction func addPressed(_ sender: AnyObject) {
        createNewItem()
        dismissVC()
    }

    func createNewItem() {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Loosegear", in: moc)
        
        let loosegear = Loosegear(entity: entityDescription!, insertInto:moc)


        loosegear.reportnumber = reportNumberField?.text
        loosegear.client = clientField?.text
        loosegear.date = date1Field?.text
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
