//
//  CustomDoctorCard.swift
//  Appoint
//
//  Created by Aman Jaiswal on 12/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import Foundation
import UIKit
class DoctorButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRaduisAnShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRaduisAnShadow()
    }
    
    func setRaduisAnShadow(){
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
}
