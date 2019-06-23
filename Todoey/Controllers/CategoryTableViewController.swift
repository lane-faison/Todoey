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
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var categoryArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add New Category of To-Do Items", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add Category", style: .default) { (action) in
            guard let name = textField.text else { return }
            
            let newCategory = Category(context: self.context)
            newCategory.name = name
            self.categoryArray.append(newCategory)
            
            self.saveCategories()
        }
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alertController.addAction(addAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    private func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching from context: \(error)")
        }
        tableView.reloadData()
    }
}

// MARK: - TableView Data Source Methods
extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            if let destinationVC = segue.destination as? ToDoListViewController {
                
            }
        }
    }
}

// MARK: - TableView Delegate Methods

extension CategoryTableViewController {
    
}

// MARK: - Data Source Manipulation Methods

extension CategoryTableViewController {
    
}
