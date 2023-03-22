//
//  Task.swift
//  To Do App
//
//  Created by Rustin Wilde on 15.03.23.
//

import Foundation

class UserTask {
    
    let defaults = UserDefaults.standard
    
    static let shared = UserTask()
    
    
    struct userTask : Codable {
        var category : String
        var title    : String
    }
    
    var taskList: [userTask]  {
        get{
            if let data = defaults.value(forKey: "taskList") as? Data {
                return  try!  PropertyListDecoder().decode([userTask].self, from: data)
                
               
            } else {
                return [userTask]()
            }
        }
        
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "taskList")
            }
        }
    
       
    }
    
    func saveTask(title: String, category: String) {
        let task = userTask(category: category, title: title)
        taskList.append(task)
        
        print("TASK LIST \(taskList)")
        
    }
}
