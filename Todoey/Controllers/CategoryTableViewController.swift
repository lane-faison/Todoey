//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Lane Faison on 6/22/19.
//  Copyright © 2019 Lane Faison. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - TableView Data Source Methods

extension CategoryTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

// MARK: - TableView Delegate Methods

extension CategoryTableViewController {
    
}

// MARK: - Data Source Manipulation Methods

extension CategoryTableViewController {
    
}
