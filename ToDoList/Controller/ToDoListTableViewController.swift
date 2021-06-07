//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Renato on 6/6/21.'
//

import UIKit

class ToDoListTableViewController: UITableViewController, AddToDoListDelegate {
    
    var taskList: [String] = []
    
    override func viewDidAppear(_ animated: Bool) {
        self.showTasks()
    }
    
    func addToDoList(_ toDoList: String) {
        taskList.append(toDoList)
    }
    
    func showTasks() {
        let task = ToDoListDao()
        
        taskList = task.fetchToDoList()
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let removeTask = ToDoListDao()
            
            removeTask.removeToDoList(indexPath.row)
            
            self.showTasks()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell     = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let taskList = taskList[indexPath.row]
        
        cell.textLabel?.text = taskList
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addToDoList" {
            if let viewController = segue.destination as? AddToDoListViewController {
                viewController.delegate = self
            }
        }
    }
}

