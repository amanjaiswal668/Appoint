//
//  PatientTableViewCell.swift
//  Appoint
//
//  Created by Aman Jaiswal on 15/05/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell, UITableViewDelegate{
    

    @IBOutlet weak var issuePicker: UITextField!
    
    @IBOutlet weak var patientName: UILabel!
    
    
    @IBOutlet weak var patientIssue: UITextField!
    
    var issues = ["Headache", "Fever", "Cold and Cough", "Overweight and Obesity", "Mental Health", "Injury and Violence"]
    
    var pickerView = UIPickerView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        pickerView.delegate = self
        pickerView.dataSource = self
        issuePicker.inputView = pickerView
        issuePicker.textAlignment = .center
        issuePicker.placeholder = "Select Issue"
         
    }
    
}

extension PatientTableViewCell : UIPickerViewDataSource, UIPickerViewDelegate{
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
        issuePicker.text = issues[row]
        issuePicker.resignFirstResponder()
    }
}







// Extensions for DatePicker.

extension PatientTableViewCell{
    
    func openDatePicker(){
//        DatePicker added.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        patientIssue.inputView = datePicker //For keyboard

//  Contenet added inside toolbar i.e. cancel, done and flexible.
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButtonClick))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonClick))
        
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelButton, flexibleButton,  doneButton], animated: false)
        
//        ToolBar added.
        patientIssue.inputAccessoryView = toolBar
    }
    
    @objc func cancelButtonClick(){
        
        patientIssue.resignFirstResponder()
    }
    
    @objc func doneButtonClick(){
        
        if let datePicker = patientIssue.inputView as? UIDatePicker{
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .medium
            patientIssue.text = dateFormat.string(from: datePicker.date)
            print(datePicker.date)
        }
        patientIssue.resignFirstResponder()
    }
    
    @objc func datePickerHandler(datePicker: UIDatePicker){
        
        
    }
}


//Extension for calling datePicker.

extension PatientTableViewCell: UITextFieldDelegate{
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
     
}
