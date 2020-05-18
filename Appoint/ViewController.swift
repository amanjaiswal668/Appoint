//
//  ViewController.swift
//  Appoint
//
//  Created by Aman Jaiswal on 07/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: UIButton) {
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
    }
    
    
    //    Toggling navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

