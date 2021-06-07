//
//  AddToDoListViewController.swift
//  ToDoList
//
//  Created by Renato on 6/6/21.
//

import UIKit

class AddToDoListViewController: UIViewController {
    
    @IBOutlet weak var addToDoListLabel: UILabel!
    @IBOutlet weak var addToDoListTextField: UITextField!
    
    var delegate: AddToDoListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    func recoveryToDoListForm() -> String? {
        guard let toDoListTextField = addToDoListTextField.text else { return nil }
        
        return toDoListTextField
    }
    
    @IBAction func addToDoListButton(_ sender: Any) {
        guard let delegate = delegate, let toDoListTextField = recoveryToDoListForm() else { return }
        
        let toDoList = ToDoListDao()
        
        toDoList.saveToDoList(toDoListTextField)
        delegate.addToDoList(toDoListTextField)
        
        navigationController?.popViewController(animated: true)
    }
}

protocol AddToDoListDelegate {
    func addToDoList(_ toDoList: String)
}
