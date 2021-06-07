//
//  ToDoListDao.swift
//  ToDoList
//
//  Created by Renato Vieira on 6/6/21.
//

import Foundation
import UIKit

class ToDoListDao {
    
    var key: String    = "toDoList"
    var tasks: [String] = []
    
    func saveToDoList(_ toDoList: String) {
        tasks = self.fetchToDoList()
        
        tasks.append(toDoList)
        UserDefaults.standard.setValue(tasks, forKey: key)
    }
    
    func fetchToDoList() -> [String] {
        let data = UserDefaults.standard.object(forKey: key)
        
        if data != nil {
            return data as! [String]
        } else {
            return []
        }
    }
    
    func removeToDoList(_ index: Int) {
        tasks = self.fetchToDoList()
        
        tasks.remove(at: index)
        UserDefaults.standard.setValue(tasks, forKey: key)
    }
}
