//
//  ToDoTableViewCell.swift
//  To Do App
//
//  Created by Rustin Wilde on 15.03.23.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var CategoryLbl: UILabel!


    @IBOutlet weak var checkBox: UIButton! {
        didSet{
            checkBox.setImage(UIImage(named:"unchecked"), for: .normal)
            checkBox.setImage(UIImage(named:"checked"), for: .selected)
        }
    }
    
    let userTask = UserTask()
    let homeScreen = HomeScreen()
    
    @IBOutlet weak var categoryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
       

    }
    
 
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       


    }
    
    @IBAction func checkBox(_ sender: UIButton) {
      
        self.checkBox.setImage(UIImage(named: "checked"), for: .normal)
        self.checkBox.alpha = 1.0
        self.checkBox.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.checkBox.alpha = 0
            self.checkBox.transform = CGAffineTransform.identity
            
        })
        if let tableView = self.superview as? UITableView {
            let indexPath = tableView.indexPath(for: self)
            tableView.dataSource?.tableView!(tableView, commit: .delete, forRowAt: indexPath!)
        }
        
        homeScreen.emptyListAppear()
       
        
    }
        
    }

    
    


public extension UIButton {
    func decreaseCount() {
        
    }

}

public extension UIView {
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    
}
 
