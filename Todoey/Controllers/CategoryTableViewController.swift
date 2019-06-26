//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Lane Faison on 6/22/19.
//  Copyright © 2019 Lane Faison. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    private var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let name = textField.text else { return }
            
            let newCategory = Category()
            newCategory.name = name
            
            self.save(category: newCategory)
        }
        
        alertController.addAction(addAction)
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new category"
            textField = alertTextField
        }
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - TableView Data Source Methods
extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        return cell
    }
}

// MARK: - TableView Delegate Methods

extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            if let destinationVC = segue.destination as? ToDoListViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destinationVC.selectedCategory = categories?[indexPath.row]
                }
            }
        }
    }
}

// MARK: - Data Source Manipulation Methods

extension CategoryTableViewController {
    private func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    private func loadCategories() {
        categories = realm.objects(Category.self)

        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        guard let categoryForDeletion = self.categories?[indexPath.row] else { return }
        
        do {
            try self.realm.write {
                self.realm.delete(categoryForDeletion)
            }
        } catch {
            print("Error removing category: \(error)")
        }
    }
}
