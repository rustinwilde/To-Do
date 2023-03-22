//
//  UI Extensions.swift
//  To Do App
//
//  Created by Rustin Wilde on 15.03.23.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius : CGFloat {
        get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIImageView {
    func roundedImage() {
           self.layer.cornerRadius = (self.frame.size.width) / 2;
           self.clipsToBounds = true
           self.layer.borderWidth = 3.0
           self.layer.borderColor = UIColor.white.cgColor
       }
}


