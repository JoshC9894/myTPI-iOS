//
//  JCAddModelTVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 26/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

var model = String()
var make = String()
var wh = String()
var ph = String()
var reach = String()
var desc = String()
var swlSelected = String()
var done = String()


var machineInfo: NSMutableArray = NSMutableArray()
var filteredModels: NSMutableArray = NSMutableArray()
var resultSearchController = UISearchController()
//, UISearchResultsUpdating

class JCAddModelTVC: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var cancel: UIBarButtonItem!

    @IBAction func cancelPressed(_ sender: AnyObject) {

        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        resultSearchController = UISearchController(searchResultsController: nil)
//        resultSearchController.searchResultsUpdater = self
//        resultSearchController.dimsBackgroundDuringPresentation = false
//        resultSearchController.searchBar.sizeToFit()
        
        self.refreshControl?.addTarget(self, action: #selector(JCAddModelTVC.refresh(_:)), for: UIControlEvents.valueChanged)
        
        self.tableView.tableHeaderView = resultSearchController.searchBar
        self.tableView.reloadData()
        self.tableView.rowHeight = 100

        
        self.fetchAllObjectsFromLocalDatastore()
        self.fetchAllObjects()

        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.075, green: 0.314, blue: 0.639, alpha: 1.00)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.tableView.backgroundColor = UIColor(red: 0.075, green: 0.314, blue: 0.639, alpha: 1.00)
        
    }
    
    func refresh(_ sender:AnyObject)
    {
        self.fetchAllObjectsFromLocalDatastore()
        self.fetchAllObjects()
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
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
            return filteredModels.count
        } else{
           return machineInfo.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JCDataCell
        
        
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
        let object: PFObject = machineInfo.object(at: indexPath.row) as! PFObject
        cell3.makeLabel?.text = object["make"] as? String
        cell3.modelLabel?.text = object["model"] as? String
        cell3.descritionLabel?.text = object["description"] as? String
        cell3.workingLabel?.text = object["workingHeight"] as? String
        cell3.platformLabel?.text = object["platformHeight"] as? String
        cell3.reachLabel?.text = object["reach"] as? String
        cell3.swlLabel?.text = object["swl"] as? String
        return cell3
//        }
        }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JCDataCell
    
            if cell3.descritionLabel.text != nil{
                desc = cell3.descritionLabel.text!
            }else {
                ""
            }
            
            if cell3.makeLabel.text != nil{
                make = cell3.makeLabel.text!
            }else {
                ""
            }
            
            if cell3.modelLabel.text != nil{
                model = cell3.modelLabel.text!
            }else {
                ""
            }
            
            if cell3.workingLabel.text != nil{
                wh = cell3.workingLabel.text!
            }else {
                ""
            }
            
            if cell3.platformLabel.text != nil{
                ph = cell3.platformLabel.text!
            }else {
                ""
            }
            
            if cell3.reachLabel.text != nil{
                reach = cell3.reachLabel.text!
            }else {
                ""
            }
            
            if cell3.swlLabel.text != nil{
                swlSelected = cell3.swlLabel.text!
            }else {
                ""
            }
        
            done = "done"

            self.dismiss(animated: true, completion: nil)
            
            print("\(cell3.descritionLabel.text!)", "\(cell3.makeLabel.text!)", "\(cell3.modelLabel.text!)", "\(cell3.workingLabel.text!)", "\(cell3.platformLabel.text!)", "\(cell3.reachLabel.text!)", "\(cell3.swlLabel.text!)")
  
        }

    
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        let query:PFQuery = PFQuery(className: "MEWPDetails")
//        
//        query.fromLocalDatastore()
//        query.whereKey("model", containsString: searchController.searchBar.text!)
//        query.findObjectsInBackgroundWithBlock{ (objects1, error) -> Void in
//            
//            if (error == nil){
//                let temp:NSArray = objects1! as NSArray
//                
//                filteredModels = temp.mutableCopy() as! NSMutableArray
//                
//                self.tableView.reloadData()
//            }
//        }
//    
//    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText.uppercased()
    }

    func fetchAllObjectsFromLocalDatastore() {
        
        let query:PFQuery = PFQuery(className: "MEWPDetails")
        query.fromLocalDatastore()
        query.findObjectsInBackground{ (objects, error) -> Void in
            
            if (error == nil){
                let temp:NSArray = objects! as NSArray
                
                machineInfo = temp.mutableCopy() as! NSMutableArray
                
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    func fetchAllObjects() {
        
       // PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
        
        let query: PFQuery = PFQuery(className: "MEWPDetails")
        query.findObjectsInBackground { (objects, error) -> Void in
         
            if (error == nil){
                PFObject.pinAll(inBackground: objects, block:nil)
                self.fetchAllObjectsFromLocalDatastore()
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    


}
