//
//  AppointmetViewController.swift
//  Appoint
//
//  Created by Aman Jaiswal on 12/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import SwiftUI
import Firebase
//import FSCalendar
class AppointmetViewController: UIViewController {

//    IObutlets for buttons, text fields and views.
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var selfUser: UIButton!
    
    @IBOutlet weak var selectUser: UIButton!
    
    @IBOutlet weak var addUser: UIButton!
    
    @IBOutlet weak var patientIssue: UITextField!
    
    @IBOutlet weak var appointDate: UITextField!
    
    
    let db = Firestore.firestore()
    
    var issues = ["Headache",
                  "Fever",
                  "Cold and Cough",
                  "Overweight and Obesity",
                  "Mental Health",
                  "Injury and Violence",
                  "Injury and Violence"]
    
    var selectedIssues: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       Calling various functions.
//       Calling issue picker.
        issuePicker()
        
        

        
        appointDate.delegate = self
        // Do any additional setup after loading the view.
        
        selfUser.designButton(borderWidth: 0,
                              borderColor: .clear)
        selectUser.designButton(borderWidth: 0,
                                borderColor: .clear)
        addUser.designButton(borderWidth: 0,
                             borderColor: .clear)
        buttonView.designView(borderWidth: 0.5,
                              borderColor: #colorLiteral(red: 0.3795269051, green: 0.7139073202, blue: 0.6483762395, alpha: 1))
    }

    @IBAction func userSelf(_ sender: Any) {
        
        changebuttonColor(userSelf: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),  userTxtSelf: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    }
    
    @IBAction func userSelect(_ sender: Any) {
        
        changebuttonColor(userSelect: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),  userTxtSelect: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    }
    
    @IBAction func userAdd(_ sender: Any) {
        
        changebuttonColor(userAdd: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),  userTxtAdd: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    }
    

//Change the color of the button from inactive to active as use press on it.

    func changebuttonColor(userSelf: UIColor = .white, userSelect: UIColor = .white, userAdd: UIColor = .white, userTxtSelf: UIColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1), userTxtSelect: UIColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1), userTxtAdd: UIColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)) {
    
    selfUser.backgroundColor = userSelf
    selectUser.backgroundColor = userSelect
    addUser.backgroundColor = userAdd
    
    
    selfUser.setTitleColor(userTxtSelf, for: .normal)
    selectUser.setTitleColor(userTxtSelect, for: .normal)
    addUser.setTitleColor(userTxtAdd, for: .normal)
            }

    @IBAction func selfCardPressed(_ sender: Any) {
   
        
    }
    
    @IBAction func selectUserPressed(_ sender: Any) {
        performSegue(withIdentifier: "try", sender: self)
    }
   
    @IBAction func addUserPressed(_ sender: Any) {
        performSegue(withIdentifier: "try", sender: self)
}
    
    
    @IBAction func bookButton(_ sender: Any) {
        
        if let issue = patientIssue.text, let patientSender = Auth.auth().currentUser?.email{
            
            db.collection("use").addDocument(data: ["patientIssue":patientIssue!]) { (error) in
                           
            //        if error != nil {
            //            // Show error message
            //            self.showError("Error saving user data")
            //        }
                    }
                }
        
        
        
        }
    }
    


    // Creating functions for saving data to firebase.

    // Function for saving user issue to database.

//    func saveUserIssue(){
//        
//       
//        
//    }
    








//Extensions.

// Extensions for DatePicker.

extension AppointmetViewController{
    
    func openDatePicker(){
//        DatePicker added.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        appointDate.inputView = datePicker //For keyboard

//  Contenet added inside toolbar i.e. cancel, done and flexible.
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonClick))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonClick))
        
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelButton, flexibleButton,  doneButton], animated: false)
        
//        ToolBar added.
        appointDate.inputAccessoryView = toolBar
    }
    
    @objc func cancelButtonClick(){
        
        appointDate.resignFirstResponder()
    }
    
    @objc func doneButtonClick(){
        
        if let datePicker = appointDate.inputView as? UIDatePicker{
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .medium
            appointDate.text = dateFormat.string(from: datePicker.date)
            print(datePicker.date)
        }
        appointDate.resignFirstResponder()
    }
    
    @objc func datePickerHandler(datePicker: UIDatePicker){
        
        
    }
}
//Extension for calling datePicker.

extension AppointmetViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
     
}

//Extension for creating pickerview.

extension AppointmetViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        issues.count
    }
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return issues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIssues = issues[row]
        patientIssue.text = selectedIssues
    }
    
    func issuePicker(){
        let issuePicker = UIPickerView()
        issuePicker.delegate = self
        patientIssue.inputView = issuePicker
    }
}


