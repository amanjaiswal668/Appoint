//
//  SignUpViewController.swift
//  Appoint
//
//  Created by Aman Jaiswal on 08/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
//    Start of connection of IBOutlets of textfields and button in SignUpViewController!

        @IBOutlet weak var fullNameTextField: UITextField!
       
        @IBOutlet weak var emailTextField: UITextField!
       
        @IBOutlet weak var aadharTextField: UITextField!
    
        @IBOutlet weak var mobileTextField: UITextField!
       
        @IBOutlet weak var passwordTextField: UITextField!
       
//       @IBOutlet weak var signUpButton: UIButton!
       
//       @IBOutlet weak var errorLabel: UILabel!
//     Start of connection of IBOutlets of textfields and button in SignUpViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Hides keyboard when tapped near fields. Reference:- keyboardOff.swift
            self.hideKeyboardWhenTappedAround()
            
        // Do any additional setup after loading the view.
        
//        Adds image icon to the right of the field.
        fullNameTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        emailTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        aadharTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        mobileTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        passwordTextField.addRightView(image: #imageLiteral(resourceName: "logout.png"))
        
    }

// Toggling navigation bar. Turn on and off navigation bar wherever needed.
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

    
//  Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
       func validateFields() -> String? {
           
           // Check that all fields are filled in
           if fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               aadharTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
               
               return "Please fill in all fields."
           }
        return nil
    }
//Tap on signup Button to save user data and hence transist user to TabBarViewController as a landing page.
    @IBAction func signUpTapped(_ sender: UIButton) {
    
    
        
// Create cleaned versions of the data.
    let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let aadhar = aadharTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
// Create the user
    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                       
// Check for errors
//                       if err != nil {
//
//                           // There was an error creating the user
//                           self.showError("Error creating user")
//                       }
//                       else {
                           
// User was created successfully, now store the name and aadhar.
    let db = Firestore.firestore()
    
    db.collection("users").addDocument(data: ["fullname":fullName, "aadhar": aadhar, "uid": result!.user.uid ]) { (error) in
               
//        if error != nil {
//            // Show error message
//            self.showError("Error saving user data")
//        }
        }
    }
                           
// Transition to the home screen
    self.transitionToHome()
                       }
 
    func transitionToHome() {
      
        
//        code for calling TabBarViewController as a landing page.
        let HomeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        
        view.window?.rootViewController = HomeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
           
    
