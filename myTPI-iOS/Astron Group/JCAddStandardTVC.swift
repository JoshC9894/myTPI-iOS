//
//  JCAddStandardTVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 09/12/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

var standardDesc: String?
var standardInfo: String?

var standardInfoArray: NSMutableArray = NSMutableArray()
var filteredInfo: NSMutableArray = NSMutableArray()
var resultSearchController1 = UISearchController()

var STANDARD = String()
var done1 = String()

class JCAddStandardTVC: UITableViewController {
    
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshControl?.addTarget(self, action: #selector(JCAddStandardTVC.refresh(_:)), for: UIControlEvents.valueChanged)
        
        self.tableView.tableHeaderView = resultSearchController.searchBar
        self.tableView.reloadData()
        self.tableView.rowHeight = 57
        
        
        self.fetchAllObjectsFromLocalDatastore()
        self.fetchAllObjects()
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.075, green: 0.314, blue: 0.639, alpha: 1.00)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.tableView.backgroundColor = UIColor(red: 0.075, green: 0.314, blue: 0.639, alpha: 1.00)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if resultSearchController.isActive{
            return filteredInfo.count
        } else{
            return standardInfoArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JCInfoCell
        
        
        //        if resultSearchController.active {
        //            let object1 = filteredModels.objectAtIndex(indexPath.row) as! PFObject
        //            cell3.makeLabel?.text = object1["make"] as? String
        //            cell3.modelLabel?.text = object1["model"] as? String
        //            cell3.descritionLabel?.text = object1["description"] as? String
        //            cell3.workingLabel?.text = object1["workingHeight"] as? String
        //            cell3.platformLabel?.text = object1["platformHeight"] as? String
        //            cell3.reachLabel?.text = object1["reach"] as? String
        //            cell3.swlLabel?.text = object1["swl"] as? String
        //            return cell3
        //
        //        } else{
        
        let object: PFObject = standardInfoArray.object(at: indexPath.row) as! PFObject
        cell.descField?.text = object["Description"] as? String
        cell.numberField?.text = object["Number"] as? String
        
        return cell
        //        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JCInfoCell
        
        if cell3.numberField.text != nil{
            STANDARD = cell3.numberField.text!
        }else {
            ""
        }
        
        done1 = "done"
        
        print(STANDARD, done)
        
        self.dismiss(animated: true, completion: nil)

    }
    
    

    func refresh(_ sender:AnyObject)
    {
        self.fetchAllObjectsFromLocalDatastore()
        self.fetchAllObjects()
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func fetchAllObjectsFromLocalDatastore() {
        
        let query:PFQuery = PFQuery(className: "StandardsList")
        query.fromLocalDatastore()
        query.findObjectsInBackground{ (objects, error) -> Void in
            
            if (error == nil){
                let temp:NSArray = objects! as NSArray
                
                standardInfoArray = temp.mutableCopy() as! NSMutableArray
                
                self.tableView.reloadData()
            }
        }
        
    }
    
    func fetchAllObjects() {
        
        // PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
        
        let query: PFQuery = PFQuery(className: "StandardsList")
        query.findObjectsInBackground { (objects, error) -> Void in
            
            if (error == nil){
                PFObject.pinAll(inBackground: objects, block:nil)
                self.fetchAllObjectsFromLocalDatastore()
            }
        }
    }
}
