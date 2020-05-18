//
//  keyboardOff.swift
//  Appoint
//
//  Created by Aman Jaiswal on 08/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
