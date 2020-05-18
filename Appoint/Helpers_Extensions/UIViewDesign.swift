//
//  UIViewDesign.swift
//  Appoint
//
//  Created by Aman Jaiswal on 08/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class customView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRaduisAnShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRaduisAnShadow()
    }
    
    func setRaduisAnShadow(){
        
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
