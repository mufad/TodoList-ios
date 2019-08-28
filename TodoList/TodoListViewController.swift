//
//  ViewController.swift
//  TodoList
//
//  Created by Mufad Monwar on 14/8/19.
//  Copyright © 2019 droiddigger. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["War", "Peace", "Love"]
    var userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        if let items = userDefaults.array(forKey: "data") as? [String] {
            itemArray = items
            self.tableView.reloadData()
        }
    }


    //MARK - TableView Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.userDefaults.set(self.itemArray, forKey: "data")
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type Something"
            
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
}

