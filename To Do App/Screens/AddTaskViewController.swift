//
//  AddTaskViewController.swift
//  To Do App
//
//  Created by Rustin Wilde on 17.03.23.
//

import UIKit
import iOSDropDown

protocol SubviewDelegate {
    func subviewWillClose()
}

class AddTaskViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var tableCell = ToDoTableViewCell()
    
    let keys = UserDefaultsKeys()

    @IBOutlet weak var taskName: UITextField!
    
    
    @IBOutlet weak var dropDownList: DropDown!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDownList.optionArray = ["Hobbies & Life", "Health & Activity", "Work", "Sport", "Family & Friends", "Education", "Daily routine"]
     
    }

    
    @IBAction func addNewTask(_ sender: Any) {
        let title = taskName.text!
        let category = dropDownList.text
        
        if !title.isEmpty && !category!.isEmpty {
            UserTask.shared.saveTask(title: title, category: category!)
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
