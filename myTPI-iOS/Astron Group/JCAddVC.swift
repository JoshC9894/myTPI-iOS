//
//  JCAddVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 28/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

class JCAddVC: UIViewController {

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var whField: UITextField!
    @IBOutlet weak var phField: UITextField!
    @IBOutlet weak var reachField: UITextField!
    @IBOutlet weak var swlField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var object: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.object = PFObject(className: "MEWPDetails")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donePressed(_ sender: AnyObject) {
        //Database
        self.object["model"] = modelField.text!
        self.object["make"] = makeField.text!
        self.object["description"] = descriptionField.text!
        self.object["reach"] = reachField.text!
        self.object["workingHeight"] = whField.text!
        self.object["platformHeight"] = phField.text!
        self.object["swl"] = swlField.text!
        
        self.object.saveEventually() { (success, error) -> Void in
            if (error == nil){
                
            }else{
                print(error?.userInfo)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
