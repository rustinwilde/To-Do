//
//  ViewController.swift
//  To Do App
//
//  Created by Rustin Wilde on 15.03.23.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var countOfTaskLbl: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyImage: UIImageView!
    
   
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        plusBtn.setImage(UIImage(named: "add"), for: .normal)
      
        view.backgroundColor =  UIColor(red: 247/255, green: 246/255, blue: 241/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 241/255, alpha: 1)
        
        profilePic.layer.cornerRadius = (profilePic?.frame.size.width ?? 0.0) / 2
        profilePic.clipsToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        countOfTaskLbl.text = "You have \(UserTask.shared.taskList.count) tasks for today"
        
       emptyListAppear()
        
        self.tableView.reloadData()
        
      
    }
 
    
    func emptyListAppear() {
        if UserTask.shared.taskList.isEmpty {
            emptyImage?.image = UIImage(named: "emptyList")
            emptyImage?.isHidden = false
        } else if UserTask.shared.taskList.count >= 1 {
            emptyImage?.isHidden = true
        }
    }
    
}

extension HomeScreen : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserTask.shared.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        cell.titleLbl.text = UserTask.shared.taskList[indexPath.row].title
        cell.CategoryLbl.text = UserTask.shared.taskList[indexPath.row].category

        cell.layer.cornerRadius = 20.0
        cell.CategoryLbl.tintColor = UIColor(red: 105/255, green: 158/255, blue: 198/255, alpha: 1)
        cell.contentView.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 241/255, alpha: 1)
        cell.categoryView.backgroundColor = UIColor(red: 211/255, green: 227/255, blue: 242/255, alpha: 1)
        cell.categoryView.layer.cornerRadius = cell.categoryView.frame.size.height / 2
        cell.CategoryLbl.frame = CGRect(x: 10, y: 0, width: cell.CategoryLbl.frame.width, height: cell.CategoryLbl.frame.height)
        cell.categoryView.frame = CGRect(x: 0, y: 0, width: cell.CategoryLbl.frame.width, height: cell.CategoryLbl.frame.height)
        cell.CategoryLbl.frame = CGRect(x: 5, y: 0, width: cell.CategoryLbl.frame.width, height: cell.CategoryLbl.frame.height)

        return cell
    }
    
  
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                print("Deleted")

                UserTask.shared.taskList.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                countOfTaskLbl.text = "You have \(UserTask.shared.taskList.count) tasks for today"
                emptyListAppear()
                
            }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

