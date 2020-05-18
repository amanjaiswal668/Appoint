//
//  ButtonDesign.swift
//  Appoint
//
//  Created by Aman Jaiswal on 07/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit


extension UIButton {
    
    func designButton(borderWidth: CGFloat = 1, borderColor : UIColor = #colorLiteral(red: 0.3374361645, green: 0.6312456129, blue: 0.6633486675, alpha: 1)){
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}



extension UIView{
    
    func designView(borderWidth: CGFloat = 0.5, borderColor : UIColor = #colorLiteral(red: 0.3374361645, green: 0.6312456129, blue: 0.6633486675, alpha: 1)){
           
           layer.cornerRadius = frame.height / 2
           clipsToBounds = true
           layer.borderWidth = borderWidth
           layer.borderColor = borderColor.cgColor
       }
    
}
