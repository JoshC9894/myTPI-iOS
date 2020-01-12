//
//  JCAddStandardVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 09/12/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

class JCAddStandardVC: UIViewController {

    var object2: PFObject!
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.object2 = PFObject(className: "StandardsList")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func donePressed(_ sender: AnyObject) {
        //Database
        self.object2["Description"] = descriptionField.text!
        self.object2["Number"] = numberField.text!
        
        
        self.object2.saveEventually() { (success, error) -> Void in
            if (error == nil){
                
            }else{
                print(error?.userInfo)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
