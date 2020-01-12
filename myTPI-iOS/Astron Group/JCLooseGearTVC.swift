//
//  JCLooseGearTVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 21/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import Parse

class JCLooseGearTVC: UITableViewController, NSFetchedResultsControllerDelegate {

    
    @IBOutlet weak var backButton: UIBarButtonItem!

    @IBAction func backbuttonTapped(_ sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: {})
    }
    //CoreData
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    var frc: NSFetchedResultsController = NSFetchedResultsController()
    
    func getFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult> {
        frc = NSFetchedResultsController(fetchRequest: inspectionFetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    func inspectionFetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Loosegear")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frc = getFetchedResultsController()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            print("Failed to perform initial fetch.")
            return
        }
        
        self.tableView.rowHeight = 60
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"tableBG"))
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        frc = getFetchedResultsController()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            print("Failed to perform initial fetch.")
            return
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        let numberOfSections = frc.sections?.count
        return numberOfSections!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "certificateCell", for: indexPath) as UITableViewCell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor.clear
        }
        
        // Configure the cell...
        
        let loosegear = frc.object(at: indexPath) as! Loosegear
        cell.textLabel?.text = loosegear.reportnumber
        let client = loosegear.client
        let date1 = loosegear.date
        cell.detailTextLabel!.text = "Client: \(client!)    Date: \(date1!)"
        
        let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        selectedView.backgroundColor = UIColor.purple.withAlphaComponent(0.6)
        
        cell.selectedBackgroundView = selectedView
        
        cell.backgroundColor = UIColor.clear
        //cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "loosegearcertSegue" {
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let loosegearController : JCLGChecklist1 = segue.destination as! JCLGChecklist1
            let loosegear : Loosegear = frc.object(at: indexPath!) as! Loosegear
            
            loosegearController.loosegear = loosegear
            
        }
        func dismissVC() {
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    
    @IBAction func addPressed(_ sender: AnyObject) {
    
    }
    
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedObject: NSManagedObject = frc.object(at: indexPath) as! NSManagedObject
        context.delete(managedObject)
        do {
            try context.save()
        } catch {
            return
        }
        self.tableView.reloadData()
    }

}
