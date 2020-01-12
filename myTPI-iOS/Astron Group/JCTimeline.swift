//
//  JCTimeline.swift
//  Astron Group
//
//  Created by Joshua Colley on 24/11/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit

class JCTimeline: UITableViewController {
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(red: 0.051, green: 0.200, blue: 0.392, alpha: 1.0)
        self.tableView.rowHeight = 150
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DismissVC(_ sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView?, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        
        
        if (indexPath.row == 0){
            
            cell = tableView!.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! JCProfileCell
            
            return cell
        } else {
            cell = tableView!.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! JCQuestionsCell
            
            return cell
        }
    }


}
