//
//  JCContainerChecksheetTVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 17/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import CoreData

class JCContainerChecksheetTVC: UITableViewController {
    
    //CoreData
    var container : Container? = nil
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
