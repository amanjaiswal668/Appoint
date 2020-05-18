 //
//  UIViewContoller+Extension.swift
//  Appoint
//
//  Created by Aman Jaiswal on 08/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import Foundation
import UIKit

 extension UIViewController {
    
    func changeRoot() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = vc
        appDelegate?.window?.makeKeyAndVisible()
        
    }
 }

