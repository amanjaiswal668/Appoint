//
//  LoginViewController.swift
//  Appoint
//
//  Created by Aman Jaiswal on 07/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

//    Start of connection of IBOutlets of textfields and button in LoginViewController!
          @IBOutlet weak var emailTextField: UITextField!
          
          @IBOutlet weak var passwordTextField: UITextField!
    
          @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      Hides keyboard when tapped near fields. Reference:- keyboardOff.swift
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
//   Adds image icon to the right of the field.
        emailTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        passwordTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
    }
    

    //    Toggling navigation bar.Turn on and off navigation bar wherever needed.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
//Tap on login Button to transist user to TabBarViewController as a landing page.
   
    @IBAction func loginTapped(_ sender: Any) {
         
         // TODO: Validate Text Fields
         
         // Create cleaned versions of the text field
         let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         
         // Signing in the user
         Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
             
             if error != nil {
                 // Couldn't sign in
                 self.errorLabel.text = error!.localizedDescription
                 self.errorLabel.alpha = 1
             }
             else {
                 
//                 let HomeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
//                 
//                 self.view.window?.rootViewController = HomeViewController
//                 self.view.window?.makeKeyAndVisible()
                
//           code for calling TabBarViewController as a landing page.
                let tabBarViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as? TabBarViewController
                
                self.view.window?.rootViewController = tabBarViewController
                self.view.window?.makeKeyAndVisible()
             }
         }
     }
    
    
    
    
    
    
}
